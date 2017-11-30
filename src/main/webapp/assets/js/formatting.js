var formatlist = ["", "s", ",%", "+,%", ",.1%", ".4r", ".4f", ".4n", ".3n", ",d", ",.0f", ".0f", ".0e", ".1e"];
var userNum = document.getElementById("userNum");
var colorLow = 'blue';
var colorHigh = 'red';

// add listener to call formatter function when user changes the number
userNum.addEventListener("input",
	function(e) {
		myFormats.changeNumber(userNum.value);
	},
	false
);

// need way to update list
formatSpecifier.addEventListener("change",
	function(e) {
		myFormats.addToList(formatSpecifier.value);
	},
	false
);

// create a little color scale function to make the output look pretty
function setColorScale(max) {
	return d3.scale.linear()
		.domain([0, max])
		.interpolate(d3.interpolateRgb)
		.range([colorLow, colorHigh]);
}

// construct code/text pairs from list of formats I could use
var constructFormatObject = function(mylist) {
	var types = [];
	mylist.forEach(function(d) {
		types.push({
			code: d3.format(d),
			text: 'd3.format("' + d + '")'
		});
	});
	return types;
};


var myFormats = new ShowFormats(
	formatlist,
	0);