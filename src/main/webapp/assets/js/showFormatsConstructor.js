/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open 
 * the template in the editor.
 */

ShowFormats = function(formatList, number) {
	// list of format specifiers to show
	this.formatList = formatList;
	this.formatObject = constructFormatObject(formatList);
	this.dataset = Array.apply(0,
		Array(this.formatObject.length)).map(function(x, y) {
		return y;
	});;
	// number to format
	this.number = number;
	this.colorScale = setColorScale(this.dataset.length)

	var self = this;

	// set up defaults
	this.selection = d3.select("tbody").selectAll("tr")
		.data(this.dataset)
		.enter()
		.append("tr");

	this.selection
		.append("td")
		.text(function(d) {
			return self.formatObject[d].text;
		})
		.style("color", function(d) {
			return self.colorScale(d)
		})
		.attr("class", "formattext");

	this.selection
		.append("td")
		.text(function(d) {
			return self.formatObject[d].code(self.number);
		})
		.style("color", function(d) {
			return self.colorScale(d)
		})
		.attr("class", "formatresult");
}

ShowFormats.prototype.changeNumber = function(number) {
	this.number = number;
	this.updateFormats();
}

ShowFormats.prototype.addToList = function(specifier) {
	this.formatList.unshift(specifier)
	this.formatObject = constructFormatObject(this.formatList);

	// update dataset array w/ new length
	this.dataset = Array.apply(0,
		Array(this.formatObject.length)).map(function(x, y) {
		return y;
	});;

	this.updateFormats();
}

ShowFormats.prototype.tdtextStyling = function(selection) {
	selection.text(function(d) {
		return self.formatObject[d].text;
	})
		.style("color", function(d) {
			return self.colorScale(d)
		})
		.attr("class", "formattext");
}

ShowFormats.prototype.tdcodeStyling = function(selection) {
	selection.text(function(d) {
		return self.formatObject[d].code(self.number);
	})
		.style("color", function(d) {
			return self.colorScale(d)
		})
		.attr("class", "formatresult");

}

ShowFormats.prototype.updateFormats = function() {
	self = this;

	// bind with current dataset
	this.selection = d3.selectAll("tbody").selectAll("tr")
		.data(self.dataset);

	// enter elements
	var k = this.selection.enter().append("tr")

	k.append("td")
		.call(self.tdtextStyling);

	k.append("td")
		.call(self.tdcodeStyling);

	// update elements
	this.selection
		.selectAll("td")
		.text(function(d, i) {
			if (i == 0) {
				return self.formatObject[d].text;
			}
			if (i == 1) {
				return self.formatObject[d].code(self.number);
			}
		})
		.style("color", function(d) {
			return self.colorScale(d)
		})
		.attr("class", function(d, i) {
			if (i == 0) {
				return "formattext"
			} else {
				return "formatresult"
			}
		})
}


