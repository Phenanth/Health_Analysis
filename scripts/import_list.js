const mysql = require('mysql')

var fs = require('fs')
var path = require('path')

const connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'charlotte2',
	database: 'health'
});

console.log('Database connected.');

