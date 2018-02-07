//Script here

//Script Generate meta res_info

var json = {};

json.index = {};

//table metadata
json.index._index = _index;
json.index._type = _type;
json.index._id = _id;

var myDocFinal = JSON.stringify(json);


//Script Generate res_info

var res_info = {};

//table metadata
{if (restaurant_id != null) {res_info.restaurant_id = restaurant_id}};
{if (restaurant_name != null) {res_info.restaurant_name = restaurant_name}};
{if (restaurant_description != null) {res_info.restaurant_description = restaurant_description}};
{if (restaurant_tel != null) {res_info.restaurant_tel = restaurant_tel.split(",");}}
{if (restaurant_mobile_tel != null) {res_info.restaurant_mobile_tel = restaurant_mobile_tel.split(",")}};
{if (restaurant_open_close  != null) {res_info.restaurant_open_close = restaurant_open_close}};
{if (restaurant_environment  != null) {res_info.restaurant_environment = restaurant_environment}};
{if (restaurant_annual_holiday  != null) {res_info.restaurant_annual_holiday = restaurant_annual_holiday}};
{if (restaurant_info_tag  != null) {res_info.restaurant_info_tag = restaurant_info_tag.split(",")}};
{if (restaurant_review_scores != null) {res_info.restaurant_avg_customer_review_scores = restaurant_review_scores}};

	// price_range array

res_info.restaurant_price_range = {};

	{if (price_range  != null) {res_info.restaurant_price_range.price_range = price_range}};
	{if (currency_code  != null) {res_info.restaurant_price_range.currency_code = currency_code}};
	{if (currency_name  != null) {res_info.restaurant_price_range.currency_name = currency_name}};

res_info.restaurant_social_contact = {};

	// social_contact array

	{if (facebook != null) {res_info.restaurant_social_contact.facebook = facebook}};
	{if (instagram != null) {res_info.restaurant_social_contact.instagram = instagram}};
	{if (line != null) {res_info.restaurant_social_contact.line = line}};
	{if (website != null) {res_info.restaurant_social_contact.website = website}};
	{if (others != null) {res_info.restaurant_social_contact.others = others}};

res_info.restaurant_customer_review_details = [];

var cus_review = {};

cus_review = reviewArray.split("|");

for(i=0; i<cus_review.length; i++){
	
	var reviewDetails = {};
	
	// customer_review object

    var cusreview = {}; 
	cusreview = cus_review[i].split(",");

	reviewDetails.customer_id = cusreview[0];
	reviewDetails.customer_username = cusreview[1];
	reviewDetails.customer_review = cusreview[2];
	reviewDetails.customer_score = str2num(cusreview[3]);

res_info.restaurant_customer_review_details.push(reviewDetails);

};


var res_infoFinal = JSON.stringify(res_info);
