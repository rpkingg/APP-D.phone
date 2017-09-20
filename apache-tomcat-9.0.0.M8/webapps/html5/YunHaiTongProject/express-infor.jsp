<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<title>������Ϣ</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/express-infor.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<header class="charge-title">
			������Ϣ
			<a class="title-back"></a>
		</header>
		<div class="expressor-wrapper">
			<img src="img/expressor@2x.png" />
			<div class="expressor-infor">
				<p><span>���͵��̣�</span><em id="shop_name"></em></p>
				<p><span>����Ա��</span><em id="delivery_name"></em><b id="phone_num"></b></p>
			</div>
		</div>
		<div class="express-track">
			<h5>��������</h5>
			<div id="delivery_container">
				<!--<div class="end-track">
					<p class="track-mes">���Ϸ��С���ǩ�գ�ǩ���ˣ������� �ᳲ</p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>
				<div class="sending-track">
					<p class="track-sending-mes">����ͨ�ֻ�����վ Ǳɽ·վ ��Ͷվ�ѽ���Ͷ��Ա�����ɼ�������������ϵ�ɼ�Ա��Ͷ��Ա�����������ݣ���ϵ�绰��
						<span>18758978785</span></p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>
				<div class="normal-track">
					<p class="track-mes">��Ʒ����</p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>
				<div class="normal-track">
					<p class="track-mes">����������л�������</p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>
				<div class="first-track">
					<p class="track-mes">�����ύ�ɹ�</p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>-->
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($, document) {
			//��ñ��ش洢�Ķ���
			var localStorageObj = window.localStorage;

			//�ӿ�·��
			var urlPath_orderLogistics = "mrsyg/kquser/OrderLogistics.form";
			var need_data_orderLogistics = {
				"order_no": localStorageObj.getItem(my_order_id)
			}
			var data_orderLogistics = myAjax(urlPath_orderLogistics, need_data_orderLogistics);
			if(data_orderLogistics != undefined) {
				init(data_orderLogistics);
			}

			function init(datas) {
				//���͵���
				var delivery_shop = datas.delivery_shop;
				$("#shop_name").text(delivery_shop);
				//����Ա����
				var delivery_name = datas.delivery_name;
				$("#delivery_name").text(delivery_name);
				//����Ա�绰
				var delivery_phone = datas.delivery_phone;
				$("#phone_num").text(delivery_phone);

				var logisticsString = "";
				$.each(datas.data, function(index, getdata) {
					//��������
					var logistics_desc = getdata.logistics_desc;
					//����ʱ��
					var created_at = getdata.created_at;
					//����״̬:1.�ύ���� 2.������� 3.��Ʒ���� 4.������Ϣ 5.ȷ��ǩ��
					var logistics_status = getdata.logistics_status;
					switch(logistics_status) {
						case "1":
							logisticsString = '<div class="first-track">' +
								'<p class="track-mes">' + logistics_desc + '</p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						case "2":
							logisticsString = '<div class="normal-track">' +
								'<p class="track-mes">' + logistics_desc + '</p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						case "3":
							logisticsString = '<div class="normal-track">' +
								'<p class="track-mes">' + logistics_desc + '</p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						case "4":
							logisticsString = '<div class="sending-track">' +
								'<p class="track-sending-mes">' + logistics_desc + '��Ͷ��Ա������' + delivery_name + '����ϵ�绰��' +
								'<span>' + delivery_phone + '</span></p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						case "5":
							logisticsString = '<div class="end-track">' +
								'<p class="track-mes">' + logistics_desc + '</p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						default:
							break;
					}
				});
				$(logisticsString).appendTo("#delivery_container");
			}

		})(jQuery, document)
	</script>

</html>