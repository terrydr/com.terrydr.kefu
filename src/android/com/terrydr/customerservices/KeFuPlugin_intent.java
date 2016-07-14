package com.terrydr.customerservices;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;
import com.qiyukf.nimlib.sdk.NimIntent;
import com.qiyukf.unicorn.R;
import com.qiyukf.unicorn.api.ConsultSource;
import com.qiyukf.unicorn.api.ProductDetail;
import com.qiyukf.unicorn.api.SavePowerConfig;
import com.qiyukf.unicorn.api.StatusBarNotificationConfig;
import com.qiyukf.unicorn.api.UICustomization;
import com.qiyukf.unicorn.api.Unicorn;
import com.qiyukf.unicorn.api.YSFOptions;
import com.qiyukf.unicorn.api.YSFUserInfo;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 * cordovaplugin启动插件类
 * @author ty
 *
 */
public class KeFuPlugin_intent extends CordovaPlugin {
	private final static String TAG = "KeFuPlugin_intent";
	private CallbackContext callbackContext;
	private String serviceKey;
	private String appName;
	private String sessionTitle;
	private String userId;
	private String userData;
	
	public KeFuPlugin_intent() {
	}

	/**
	 * 启动插件的主要方法
	 */
	@Override
	public boolean execute(String action, org.json.JSONArray args,
			CallbackContext callbackContext) throws org.json.JSONException {
		
		if (action.equals("tdRegisterKefu")) { //注册七鱼客服
			parseIntent();
			Log.e(TAG, "tdRegisterKefu");
			serviceKey = args.getString(0);
			appName = args.getString(1);
			DemoPreferences.init(cordova.getActivity());
	        //you can use "new FrescoImageLoader()" or "new PicassoImageLoader()"
	        if (!Unicorn.init(cordova.getActivity(), serviceKey, ysfOptions(), new UILImageLoader())) {
	            Log.e(TAG, "init qiyu sdk error!");
	        }

	        if (inMainProcess(cordova.getActivity())) {
	            DemoCache.context = cordova.getActivity().getApplicationContext();
	            ImageLoader.getInstance().init(ImageLoaderConfiguration.createDefault(cordova.getActivity()));
	            Fresco.initialize(cordova.getActivity());
	        }
			return true;
		} else if (action.equals("tdConnectKefu")) { //连接七鱼客服
			Log.e(TAG, "tdConnectKefu");
			if(!Unicorn.isServiceAvailable()){
				Log.e(TAG, "Unicorn is available");
				return false;
			}
			sessionTitle = args.getString(0);
			userId = args.getString(1);
			userData = args.getString(2);
			this.callbackContext = callbackContext;
			YSFUserInfo userInfo = new YSFUserInfo();
			userInfo.userId = userId;
			userInfo.data = userData;
			Unicorn.setUserInfo(userInfo);
			String title = sessionTitle;
			ConsultSource source = new ConsultSource("http://www.terrydr.com", "泰立瑞",null);
			// 请注意： 调用该接口前，应先检查Unicorn.isServiceAvailable(),
			// 如果返回为false，该接口不会有任何动作
			Unicorn.openServiceActivity(cordova.getActivity(), // 上下文
					title, // 聊天窗口的标题
					source // 咨询的发起来源，包括发起咨询的url，title，描述信息等
			);
			return true;
		}else if (action.equals("tdLogoutKefu")) { //注销七鱼客服
			Log.e("TAG", "tdLogoutKefu");
			Unicorn.setUserInfo(null);
			return true;
		}
		return false;
	}
	
	/**
	 * 消息提醒再次跳转到客服聊天界面
	 */
	@Override
	public void onNewIntent(Intent intent) {
		super.onNewIntent(intent);
		cordova.getActivity().setIntent(intent);
		parseIntent();
	}
	
	/**
	 * 配置参数
	 * @return
	 */
	private YSFOptions ysfOptions() {
        YSFOptions options = new YSFOptions();
        options.uiCustomization = new UICustomization();
        options.uiCustomization.titleBackgroundResId= R.color.ysf_terrydr_color_blue;
        options.uiCustomization.titleBarStyle = 1;
//        options.uiCustomization.titleBackgroundResId= Color.parseColor("#0089f1");
        
        options.statusBarNotificationConfig = new StatusBarNotificationConfig();
        options.savePowerConfig = new SavePowerConfig();
//        DemoCache.ysfOptions = options;
        return options;
    }
	
	/**
	 * 重定向intent
	 */
	private void parseIntent() {
		 Intent intent = cordova.getActivity().getIntent();
		 if (intent.hasExtra(NimIntent.EXTRA_NOTIFY_CONTENT)) {
			consultService(cordova.getActivity(), "http://www.terrydr.com", "泰立瑞",
					null);
			// 最好将intent清掉，以免从堆栈恢复时又打开客服窗口
			cordova.getActivity().setIntent(new Intent());
		 }
	}
	
	/**
	 * 启动客服
	 * @param context
	 * @param uri
	 * @param title
	 * @param productDetail
	 */
	public void consultService(Context context, String uri,
			String title, ProductDetail productDetail) {
		if (!Unicorn.isServiceAvailable()) {
			return;
		}
		// 启动聊天界面
		ConsultSource source = new ConsultSource(uri, title, null);
		source.productDetail = productDetail;
		Unicorn.openServiceActivity(context, sessionTitle, source);
	}

    public static boolean inMainProcess(Context context) {
        String packageName = context.getPackageName();
        String processName = Utils.getProcessName(context);
        return packageName.equals(processName);
    }
	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent intent) {
		super.onActivityResult(requestCode, resultCode, intent);
		switch (resultCode) { // resultCode为回传的标记，回传的是RESULT_OK
		case 0:
			break;
		
		default:
			break;
		}
	}
	
}
