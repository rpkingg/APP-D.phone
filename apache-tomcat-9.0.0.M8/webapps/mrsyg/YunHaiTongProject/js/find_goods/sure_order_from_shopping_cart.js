(function($, doc) {
	$.init();
	$.ready(function() {
		//���ʽ
		var payModePicker = new $.PopPicker({
			layer: 1
		});
		payModePicker.setData(payModeData);

		document.getElementById('payModecontainer').addEventListener('tap', function(event) {
			document.activeElement.blur();
			payModePicker.show(function(items) {
				var payModeDom = (items[0] || {}).text + " ";
				doc.getElementById('payModeText').innerHTML = payModeDom;
			});
		}, false);
		//���ͷ�ʽ
		var distributionModePicker = new $.PopPicker({
			layer: 1
		});
		distributionModePicker.setData(distributionModeData);

		document.getElementById('distributionModeInfo').addEventListener('tap', function(event) {
			document.activeElement.blur();
			distributionModePicker.show(function(items) {
				var distributionModeDom = (items[0] || {}).text + " ";
				doc.getElementById('distributionModeText').innerHTML = distributionModeDom;
			});
		}, false);

	});
})(mui, document);

//��ñ��ش洢�Ķ���
var localStorageObj = window.localStorage;

var request = new queryString();
var shopping_cart_ids = request["shopping_cart_ids"]; //���ﳵid
console.log("shopping_cart_ids=" + shopping_cart_ids);

var coupon_id = ""; //��ʼ���Ż�ȯid
var coupon_mount = ""; //�Ż�ȯ���
var order_no = ""; //�������
var address_id = ""; //�ջ���ַid
var product_sum_prices = ""; //��Ʒ�ܼ�
var shop_id = ""; //����id

//�ӿ�·����ȷ�϶���--��ʼ��ҳ�棩
//mrsyg/kqgoods/SubmitCart.form?cart_ids=3
var urlPath_one = "mrsyg/kqgoods/SubmitCart.form";
var need_data = {
	"cart_ids": shopping_cart_ids
};
var data_one = myAjax(urlPath_one, need_data);
if(data_one != undefined) {
	init(data_one);
}

//ѡ���ջ���ַ�¼�
$('.get-goods-address').click(function(e) {
	//��ʾ�ջ���ַҳ��
	$("#iframe_select_address").show();

	//��ѡ���ջ���ַ����ҳ��ر�ʱ����ǰҳ������ѡ����ջ���ַ����Ϣ
	$($("#iframe_select_address_id")[0].contentWindow).on("setReceiverAddress", function() {
		//�����ջ���ַid
		address_id = $("#iframe_select_address_id").contents().find("#receiver_address_id").val();
		//�����ջ�������
		var receiverName = $("#iframe_select_address_id").contents().find("#receiver_name").val();
		$("#receiver_name_id").text(receiverName);
		//�����ջ��˵绰
		var receiverPhone = $("#iframe_select_address_id").contents().find("#receiver_phone").val();
		$("#receiver_phone_id").text(receiverPhone);
		//�����ջ���ַ
		var receiverAddress = $("#iframe_select_address_id").contents().find("#receiver_address_content").val();
		$("#receiver_address_id").text(receiverAddress);

		//����ѡ���ջ���ַ
		$(".no-default-address").hide();
		//��ʾ�ջ���ַ
		$(".has-default-address").show();
	});

});

//�����ŵ� ѡ���¼�
$('.distribution-store').click(function(e) {
	//��ʾѡ�����ҳ��
	$("#iframe_select_store").show();

	//��ѡ�������ŵ����ҳ��ر�ʱ����ǰҳ������ѡ��ĵ�����Ϣ
	$($("#iframe_select_store_id")[0].contentWindow).on("setShopInfo", function() {
		//���õ���id
		shop_id = $("#iframe_select_store_id").contents().find("#selected_shop_id").val();
		$(".distribution-store-base").attr("id", shop_id);
		//���õ�������
		$("#shop_grade_score_container").empty();
		var shopName = $("#iframe_select_store_id").contents().find("#selected_shop_name").val();
		$("#shop_name_id").text(shopName);
		//���õ��̵ȼ�
		var shop_grade = parseFloat($("#iframe_select_store_id").contents().find("#selected_shop_grade").val());
		var redStards = "";
		var grayStards = "";
		var shopGrade = '<span class="store-score-text">' + shop_grade + '</span>';
		for(var i = 0; i < shop_grade; i++) {
			redStards = redStards + '<span class="iconfont icon-g score"></span>';
		}
		for(var i = 0; i < 5 - shop_grade; i++) {
			grayStards = grayStards + '<span class="iconfont icon-g"></span>';
		}
		$(redStards + grayStards + shopGrade).appendTo("#shop_grade_score_container");
		//���õ��̵�ַ
		var shopAddress = $("#iframe_select_store_id").contents().find("#selected_shop_address").val();
		$("#shop_address_id").text(shopAddress);
	});

});

//ѡ����Ʒ����ȯ�¼�
$('.goods-voucher').click(function(e) {
	localStorageObj.setItem("product_sum_prices", product_sum_prices);
	$("#iframe_select_vouchers_id").attr("src", "select_vouchers.jsp");
	//��ʾѡ���Ż�ȯҳ��
	$("#iframe_select_vouchers").show();
});

//����֧���¼�������ѡ��֧����ʽ����
$('.pay-now').click(function(e) {
	console.log("sure_order.js������֧��");
	//�����ж��Ƿ�ѡ�����ջ���ַ����Ϊ�գ�
	if(address_id.length > 0) {
		//��ø��ʽ(0����֧��1��������)
		var pay_way = $("#payModeText").text().trim();
		if(pay_way == "��������") {
			pay_way = 1;
		} else if(pay_way == "����֧��") {
			pay_way = 0;
		}
		//������ͷ�ʽ(0��������1�ͻ�����)
		var delivery_way = $("#distributionModeText").text().trim();
		if(delivery_way == "��������") {
			delivery_way = 0;
		} else if(delivery_way == "�ͻ�����") {
			delivery_way = 1;
		}
		//���ɶ���
		var urlPath_generateOrder = "mrsyg/kqgoods/GenerateOrder.form";
		var need_generateOrder = {
			"cart_ids": shopping_cart_ids,
			"address_id": address_id,
			"pay_way": pay_way,
			"delivery_way": delivery_way,
			"shop_id": shop_id,
			"coupon_id": coupon_id
		};

		var data_generateOrder = myAjax(urlPath_generateOrder, need_generateOrder);
		if(data_generateOrder != undefined) {
			console.log("sure_order.js��pay_way=" + pay_way + ",delivery_way=" + delivery_way);
			//��÷��صĶ������
			order_no = data_generateOrder.order_no;
			if(pay_way == 0) {
				//����֧����ʽѡ���
				$('.backdrop').show();
				$('.select-pay-tool-container').show();
				$("body").on("touchmove", function(event) {
					event.preventDefault;
				}, false);
			} else {
				//��ת���ҵĶ���ҳ��
				window.location.href = "my_order.jsp";
			}
		}
	} else {
		alert("��ѡ���ջ���ַ");
	}
});

//ȡ������֧��
$('.backdrop,.icon-guanbi').click(function(e) {
	$('.select-pay-tool-container').hide();
	$('.backdrop').hide();
	$("body").off("touchmove");
});

//֧������΢��֧�����л�
var payWay = "1";
$('.pay-tool-item').click(function() {
	payWay = $(this).find(".pay-tool-name").attr("id");
	if(payWay == "1") {
		if($(this).find('.iconfont').hasClass('icon-quan')) {
			$(this).find('.iconfont').removeClass('icon-quan');
			$(this).find('.iconfont').addClass('icon-xuanzedui');
			$(this).siblings('div').find('.iconfont').removeClass('icon-xuanzedui');
			$(this).siblings('div').find('.iconfont').addClass('icon-quan');
		}
	} else if(payWay == "2") {
		alert("�ݲ�֧��΢��֧��");
	}
});

//ȷ��֧��
$('.sure-pay-opt-nar').click(function(e) {
	if(payWay == "1") {
		localStorageObj.setItem("order_num", order_no);
		//order_pay_way���ʽ:0֧����1΢��
		localStorageObj.setItem("order_pay_way", "0");
		//order_pay_type����:0���ѳ�ֵ1������ֵ2��Ʒ����
		localStorageObj.setItem("order_pay_type", "2");
		//΢��֧��
		var data = '<div class="iframe_container" id="iframe_alipayment">' +
			'<iframe id="iframe_alipayment_id" src="alipayment.jsp" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>' +
			'</div>';
		$(data).appendTo("body");
		$("#iframe_alipayment").show();

	} else if(payWay == "2") {
		alert("΢��");
	}

});

function init(data) {
	//�ջ���ַid
	address_id = data.address_id;
	if(address_id) {
		//��ʾ�ջ���ַ
		$(".has-default-address").show();
	} else {
		//��ʾѡ���ջ���ַ
		$(".no-default-address").show();
	}
	//�ջ�������
	var receiver_name = data.receiver_name;
	//alert("receiver_name=" + receiver_name);
	$("#receiver_name_id").text(receiver_name);
	//�ջ��˵绰
	var receiver_phone = data.receiver_phone;
	$("#receiver_phone_id").text(receiver_phone);
	//����������
	var receiver_area = data.receiver_area;
	//��ϸ��ַ
	var detail_address = data.detail_address;
	$("#receiver_address_id").text(receiver_area + " " + detail_address);
	//Ĭ�ϸ��ʽ(0����֧��1��������)
	var pay_way = data.pay_way;
	if(pay_way == 0) {
		$("#payModeText").text("����֧��");
	} else if(pay_way == 1) {
		$("#payModeText").text("��������");
	}
	//��������
	var shop_name = data.shop_name;
	$("#shop_name_id").text(shop_name);
	//���̵ȼ�
	var shop_grade = data.shop_grade;
	var redStards = "";
	var grayStards = "";
	var shopGrade = '<span class="store-score-text">' + shop_grade + '</span>';
	for(var i = 0; i < shop_grade; i++) {
		redStards = redStards + '<span class="iconfont icon-g score"></span>';
	}
	for(var i = 0; i < 5 - shop_grade; i++) {
		grayStards = grayStards + '<span class="iconfont icon-g"></span>';
	}
	$("#shop_grade_score_container").empty();
	$(redStards + grayStards + shopGrade).appendTo("#shop_grade_score_container");
	//���̵�ַ
	var shop_address = data.shop_address;
	$("#shop_address_id").text(shop_address);
	//����id
	shop_id = data.shop_id;
	$(".distribution-store-base").attr("id", shop_id);
	//Ĭ�����ͷ�ʽ(0��������1�ͻ�����)
	var delivery_way = data.delivery_way;
	if(delivery_way == 0) {
		$("#distributionModeText").text("��������");
	} else if(delivery_way == 1) {
		$("#distributionModeText").text("�ͻ�����");
	}
	//��Ʒ�ܼ�
	product_sum_prices = data.price_sum;
	product_sum_prices = parseFloat(product_sum_prices).toFixed(2);
	$.each(data.goodsinfo, function(index, getdata) {
		//��Ʒid
		var product_id = getdata.product_id;
		//��ƷͼƬ
		var picture_url = getdata.picture_url;
		//��Ʒ����
		var product_name = getdata.product_name;
		//��Ʒ�۸�
		var product_price = getdata.product_price;
		//��Ʒ����
		var product_number = getdata.product_number;
		$("#product_count_id").text(product_number);
		//��Ʒ��ɫ
		var color = getdata.color;
		//��Ʒ�ڴ�����
		var memory_capacity = getdata.memory_capacity;
		//��Ʒ��Ӫ��
		var supplier_desc = getdata.supplier_desc;
		//��Ʒ�ײ�����
		var contract_name = getdata.contract_name;
		$("#product_par").text(color + " " + memory_capacity + " " + supplier_desc + " " + contract_name);
		var needString = '<div class="goods-selected-info col-xs-12">' +
			'<div class="goods-pic col-xs-2">' +
			'<img id="product_pic_id" src="' + picture_url + '">' +
			'</div>' +
			'<div class="goods-base-info col-xs-8 text-left">' +
			'<span class="goods-name col-xs-12" id="product_name_id">' + product_name + '</span>' +
			'<span class="goods-attr col-xs-12" id="product_par">' + color + " " + memory_capacity + " " + supplier_desc + " " + contract_name + '</span>' +
			'</div>' +
			'<div class="goods-price-num col-xs-2 text-right">' +
			'<span class="goods-price col-xs-12">��<span id="product_price_id">' + product_price + '</span></span>' +
			'<span class="buy-num col-xs-12">x<span id="product_count_id">' + product_number + '</span></span>' +
			'</div>' +
			'</div>';
		$(needString).appendTo("#product_container");	
	});
	//������Ʒ�ܼ�
	$("#product_sum_price").text(product_sum_prices);
	//����--С��--���
	$("#sub_total").text("��" + product_sum_prices);
	//����--��֧��--���
	$("#need_pay").text("��" + product_sum_prices);
	//����--֧������--���
	$("#pop_up_money").text("��" + product_sum_prices);
	
}

//ѡ���Ż�ȯ��ҳ���е��õķ���
function setVoucher() {
	//��ȡ��ҳ��ѡ���Ż�ȯ��id
	coupon_id = $("#iframe_select_vouchers_id").contents().find("#coupon_id").val();
	//��ȡ��ҳ��ѡ�е��Ż�ȯ���
	coupon_mount = $("#iframe_select_vouchers_id").contents().find("#coupon_amount").val();
	//�����Ż�ȯ���
	$("#voucher-sum").text("-��" + coupon_mount);
	//����--С��--���
	var sub_total = parseFloat(product_sum_prices) - parseFloat(coupon_mount);
	$("#sub_total").text("��" + sub_total);
	//����--��֧��--���
	$("#need_pay").text("��" + sub_total);
	//����--֧������--���
	$("#pop_up_money").text("��" + sub_total);
}