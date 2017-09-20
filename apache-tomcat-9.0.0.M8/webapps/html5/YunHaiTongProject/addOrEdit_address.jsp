<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="gbk">
        <title>���ӻ��߱༭�ջ���ַ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta name="renderer" content="webkit">

        <!-- ͼ���css -->
        <link rel="stylesheet" href="css/common/iconfont/iconfont.css">
        <link rel="stylesheet" href="css/common/mui.css">
        <link rel="stylesheet" href="css/common/mui.picker.css">
        <link rel="stylesheet" href="css/common/mui.poppicker.css">
        <link rel="stylesheet" href="css/dxt.css"> 
        <link rel="stylesheet" href="css/find_goods/addOrEdit_address.css">
        <!-- ����jquery.js-->
        <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="js/common/city.data.js"></script>
        <script type="text/javascript" src="js/common/mui.min.js"></script>
        <script type="text/javascript" src="js/common/mui.picker.js"></script>
        <script type="text/javascript" src="js/common/mui.poppicker.js"></script>
    </head>
    <body ontouchstart="" class="container">
        <section class="add-edit-address-container row">
            <div class="input-address-container col-xs-12">
                <form class="form-horizontal">
                    <div class="user-name form-group col-xs-12">
                        <label class="control-label col-xs-3" for="userName">�ջ���</label>
                        <div class="input-view col-xs-9">
                            <input type="text" class="form-control" id="userName" name="getGoodsUserName" value="">
                        </div>
                    </div>
                    <div class="user-iphone form-group col-xs-12">
                        <label class="control-label col-xs-3" for="userIphone">��ϵ�绰</label>
                        <div class="input-view col-xs-9">
                            <input type="text" class="form-control" id="userIphone" name="getGoodsUserPhone" value="" maxlength="11">
                        </div>
                    </div>
                    <div id="userArea" class="user-area form-group col-xs-12">
                        <label class="control-label col-xs-3">��������</label>
                        <div class="input-view-child col-xs-8">
                            <span id="getGoodsUserOfProvince">&nbsp;</span>
                            <span id="getGoodsUserOfCity">&nbsp;</span>
                            <span id="getGoodsUserOfAreas">&nbsp;</span>
                        </div>
                        <div class="select-area col-xs-3 text-right">
                            <span>��ѡ��</span><span class="iconfont icon-jiantou-copy"></span>
                        </div>
                    </div>
                    <div class="user-detail form-group col-xs-12">
                        <textarea class="form-control" id="user_detail_address" rows="4" placeholder="����д��ϸ��ַ��������5����" name="getGoodsDetail"></textarea>
                    </div>
                </form>
                <div class="save-address-btn col-xs-12 text-center">
                    <a class="btn btn-default col-xs-12" role="button">����</a>
                </div>
            </div>
        </section>
        
        <!--�༭�������ĵ�ַ��Ϣ-->
        <input style="display: none;" id="edited_address_name" placeholder="�༭����ջ�������"/>
        <input style="display: none;" id="edited_address_phone" placeholder="�༭����ջ��˵绰"/>
        <input style="display: none;" id="edited_address_area" placeholder="�༭����ջ�����ʡ������"/>
        <input style="display: none;" id="edited_address_detail_area" placeholder="�༭����ջ���ϸ��ַ"/>
        <input style="display: none;" id="edited_address_use_flag" placeholder="�༭����ջ���ַ�Ƿ����"/>
        <input style="display: none;" id="edited_address_id" placeholder="��������ջ���ַid"/>
        
    </body>
    <script type="text/javascript" src="js/common_js/my_tools.js"></script>
    <script type="text/javascript" src="js/find_goods/addOrEdit_address.js"></script>
</html>