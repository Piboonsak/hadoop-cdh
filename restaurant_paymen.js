//Script here

//Script Generate meta restaurant_paymen
var json = {};

json.index = {};

//table metadata
json.index._index = _index;
json.index._type = _type;
json.index._id = _id;

var myDocFinal = JSON.stringify(json);


//Script Generate restaurant_payment

var res_payment = {};

//table metadata

{if (restaurant_id != null) {res_payment.restaurant_id = restaurant_id}};
{if (restaurant_name != null) {res_payment.restaurant_name = restaurant_name}};
{if (restaurant_credit_card_accept != null) {res_payment.restaurant_credit_card_accept = restaurant_credit_card_accept}};
{if (restaurant_debit_card_accept != null) {res_payment.restaurant_debit_card_accept = restaurant_debit_card_accept}};
{if (restaurant_app_payment_accept != null) {res_payment.restaurant_app_payment_accept = restaurant_app_payment_accept}};
{if (restaurant_qr_payment_accept != null) {res_payment.restaurant_qr_payment_accept = restaurant_qr_payment_accept}};
{if (restaurant_payment_tag != null) {res_payment.restaurant_payment_tag = restaurant_payment_tag.split(",")}};

res_payment.restaurant_rabbit_payment = {};

	{if (accept_rabbit != null) {res_payment.restaurant_rabbit_payment.accept_rabbit = accept_rabbit}};
	{if (rabbit_privillage != null) {res_payment.restaurant_rabbit_payment.rabbit_privillage = rabbit_privillage}};

res_payment.restaurant_rabbit_linepay_payment = {};

	{if (accept_rabbit_linepay != null) {res_payment.restaurant_rabbit_linepay_payment.accept_rabbit_linepay = accept_rabbit_linepay}};
	{if (rabbit_linepay_privillage != null) {res_payment.restaurant_rabbit_linepay_payment.rabbit_linepay_privillage = rabbit_linepay_privillage}};

res_payment.restaurant_promptpay_payment = {};

	{if (accept_promptpay  != null) {res_payment.restaurant_promptpay_payment.accept_promptpay = accept_promptpay}};
	{if (promptpay_privillage  != null) {res_payment.restaurant_promptpay_payment.promptpay_privillage = promptpay_privillage}};

//app_payment
res_payment.restaurant_app_payment_details = [];

var app = {};

	app = app_payment.split("|");

for(i=0; i<app.length; i++){
	
	var appDetails = {};
	
	// app_payment object

    var app_Details = {}; 
	app_Details = app[i].split(",");

	appDetails.app_name = app_Details[0];
	appDetails.app_privillage = app_Details[1];

res_payment.restaurant_app_payment_details.push(appDetails);

};


//qr_payment
res_payment.restaurant_qr_payment_details = [];

var qr = {};

	qr = qr_payment.split("|");

for(i=0; i<qr.length; i++){
	
	var qrDetails = {};
	
	// customer_review object

    var qrArray = {}; 
	qrArray = qr[i].split(",");

	qrDetails.qr_app_name = qrArray[0];
	qrDetails.qr_app_privillage = qrArray[1];

res_payment.restaurant_qr_payment_details.push(qrDetails);

};

//credit_card
res_payment.restaurant_credit_card_details = [];

var credit = {};

	credit = credit_card.split("|");

for(i=0; i<credit.length; i++){
	
	var creditDetails = {};
	
	// customer_review object

    var creditArray = {}; 
	creditArray = credit[i].split(",");

	creditDetails.credit_card_type = creditArray[0];
	creditDetails.credit_card_bank = creditArray[1];
	creditDetails.credit_card_condition = creditArray[2];
	creditDetails.credit_card_privillage = creditArray[3];

res_payment.restaurant_credit_card_details.push(creditDetails);

};


//debit_card
res_payment.restaurant_debit_card_details = [];

var debit = {};

	debit = debit_card.split("|");

for(i=0; i<debit.length; i++){
	
	var debitDetails = {};
	
	// customer_review object

    var debitArray = {}; 
	debitArray = debit[i].split(",");

	debitDetails.debit_card_type = debitArray[0];
	debitDetails.debit_card_bank = debitArray[1];
	debitDetails.debit_card_condition = debitArray[2];
	debitDetails.debit_card_privillage = debitArray[3];

res_payment.restaurant_debit_card_details.push(debitDetails);

};


var res_infoFinal = JSON.stringify(res_payment);
