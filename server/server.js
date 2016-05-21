var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.all('/*', function(req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Headers", "X-Requested-With", "Content-Type, Accept");
	res.header("Access-Control-Allow-Methods", "POST", "GET");
	next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));

var courses = [
	{
		id: 1,
		title: "1. Course Overview and iOS9 introduction",
		courseName: "Stanford - Developing iOS 9 Apps with Swift",
		iframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/_lRx1zoriPo?list=PLsJq-VuSo2k26duIWzNjXztkZ7VrbppkT" frameborder="0" allowfullscreen></iframe>',
		thumbnail: "https://d9tyu2epg3boq.cloudfront.net/institutions/stanford.png"
	}
];

app.get('/courses', function(req, res) {
	console.log("GET from server");
	res.send(courses);
});

app.listen(6069);