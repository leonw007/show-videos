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
		thumbnail: "https://i.ytimg.com/vi/_lRx1zoriPo/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=OynbST65v-aAyaJp6E80gIqRdtk"
	},
	{
		id: 2,
		title: "2. Applying MVC",
		courseName: "Stanford - Developing iOS 9 Apps with Swift",
		iframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/j50mPzDMWVQ?list=PLsJq-VuSo2k26duIWzNjXztkZ7VrbppkT" frameborder="0" allowfullscreen></iframe>',
		thumbnail: "https://i.ytimg.com/vi/j50mPzDMWVQ/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=w9UYuEqqXzUm4ZznRgV6T6II2gs"
	},
	{
		id: 3,
		title: "3. More Swift and Foundation Framework",
		courseName: "Stanford - Developing iOS 9 Apps with Swift",
		iframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/NrTTCaL2xQM?list=PLsJq-VuSo2k26duIWzNjXztkZ7VrbppkT" frameborder="0" allowfullscreen></iframe>',
		thumbnail: "https://i.ytimg.com/vi/NrTTCaL2xQM/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=V-g4Tby7V7kMdZvhHGco9qKKwDI"
	}	
];

app.get('/courses', function(req, res) {
	console.log("GET from server");
	res.send(courses);
});

app.listen(6069);