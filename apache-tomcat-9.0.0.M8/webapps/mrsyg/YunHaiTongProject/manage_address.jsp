<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>�����ջ���ַ</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<!-- ͼ���css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/find_goods/manage_address.css">
		<!-- ����jquery.js -->
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
	</head>

	<body ontouchstart="" class="container">
		<section class="manage-address-container row">
			<!--<div class="goods-address-item col-xs-12" id="00">
				<div class="goods-address col-xs-12">
					<span class="address-user-info col-xs-12"><span class="receiver_name">����</span>(<span class="receiver_phone">13965025668</span>)</span>
					<span class="address-detail-info col-xs-12">
                    	<span class="receiver_area">����ʡ&nbsp;�Ϸ���&nbsp;������&nbsp;</span>
					<span class="receiver_detail_area">����·�������2��д��¥1702��</span></span>
				</div>
				<div class="address-opt-bar col-xs-12">
					<div class="set-default col-xs-6" set-default-get-goods-address>
						<span class="iconfont icon-quan"></span>
						<span>��ΪĬ��</span>
					</div>
					<div class="del-address col-xs-2 col-xs-offset-1 text-right">
						<span class="iconfont icon-shanchu"></span>
						<span>ɾ��</span>
					</div>
					<div class="edit-address col-xs-2 col-xs-offset-1 text-right">
						<span class="iconfont icon-bianji2"></span>
						<span>�༭</span>
					</div>
				</div>
			</div>-->
			<!--<div class="goods-address-item col-xs-12" id="01">
				<div class="goods-address col-xs-12">
					<span class="address-user-info col-xs-12"><span class="receiver_name">����</span>(<span class="receiver_phone">13965025668</span>)</span>
					<span class="address-detail-info col-xs-12">
                    	<span class="receiver_area">����ʡ&nbsp;�Ϸ���&nbsp;������&nbsp;</span>
					<span class="receiver_detail_area">����·�������2��д��¥1702��</span></span>
				</div>
				<div class="address-opt-bar col-xs-12">
					<div class="set-default col-xs-6" set-default-get-goods-address>
						<span class="iconfont icon-xuanzedui"></span>
						<span class="default-text">��ΪĬ��</span>
					</div>
					<div class="del-address col-xs-2 col-xs-offset-1 text-right">
						<span class="iconfont icon-shanchu"></span>
						<span>ɾ��</span>
					</div>
					<div class="edit-address col-xs-2 col-xs-offset-1 text-right">
						<span class="iconfont icon-bianji2"></span>
						<span>�༭</span>
					</div>
				</div>
			</div>-->
			
		</section>
		<div class="add_new_address">���ӵ�ַ</div>
		
			
		<!--�����ջ���ַҳ��-->
         <div class="iframe_container" id="iframe_addOrEdit_address">
			<iframe id="iframe_addOrEdit_address_id" src="addOrEdit_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>
		
		<!--�洢ѡ�е��ջ���ַ��Ϣ-->
		<input style="display: none;" id="selected_manage_address_name" placeholder="�ջ�������"/>
		<input style="display: none;" id="selected_manage_address_phone" placeholder="�ջ��˵绰"/>
		<input style="display: none;" id="selected_manage_address_area" placeholder="�ջ���ַ��ʡ������"/>
		<input style="display: none;" id="selected_manage_address_detail_area" placeholder="�ջ���ַ(��ϸ��ַ)"/>
		<input style="display: none;" id="selected_manage_address_id" placeholder="��ַid"/>
		<input style="display: none;" id="selected_manage_address_use_flag" placeholder="��ַ�Ƿ����"/>
		
		<!--�洢�༭�ջ���ַ����Ϣ-->
		<input style="display: none;" id="edit_manage_address_name" placeholder="�ջ�������"/>
		<input style="display: none;" id="edit_manage_address_phone" placeholder="�ջ��˵绰"/>
		<input style="display: none;" id="edit_manage_address_area" placeholder="�ջ���ַ��ʡ������"/>
		<input style="display: none;" id="edit_manage_address_detail_area" placeholder="�ջ���ַ(��ϸ��ַ)"/>
		<input style="display: none;" id="edit_manage_address_id" placeholder="��ַid"/>
		<input style="display: none;" id="edit_manage_address_use_flag" placeholder="��ַ�Ƿ����"/>
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/find_goods/manage_address.js"></script>
</html>