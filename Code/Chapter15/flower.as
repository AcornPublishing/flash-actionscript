createFlower = function (flower, numberOfPetals, fWidth, fHeight, fX, fY) {
	var flower, numberOfPetals, petals, fWidth, fHeight, fX, fY;
	this.createEmptyMovieClip(flower, fDepth);
	this.fDepth++;
	this[flower]._x = fX;
	this[flower]._y = fY;
	this[flower].numberOfPetals = numberOfPetals;
	this[flower].fWidth = fWidth;
	this[flower].fHeight = fHeight;
	initializeFlower.apply(this[flower]);
};
//
//
initializeFlower = function () {
	// initialize the flower variables and events
	this.createPetals = function(numPetals) {
		var numPetals, petals;
		for (petals=0; petals<numPetals; petals++) {
			this.createEmptyMovieClip("petal"+petals, petals);
			this["petal"+petals]._rotation = petals*(360/numPetals);
		}
	};
	// 
	this.drawpetal = function(petal, color, alpha) {
		path = this[petal];
		path.clear();
		path.lineStyle(0, 0x505060, 30);
		path.beginFill(color, alpha);
		path.moveTo(this.x[0], this.y[0]);
		path.curveTo(this.x[1], this.y[1], this.x[2], this.y[2]);
		path.curveTo(this.x[3], this.y[3], this.x[0], this.y[0]);
		path.endFill(this.x[0], this.y[0]);
	};
	//
	this.petalControl = function() {
		for (i=1; i<4; i++) {
			this.x[i] += this.sX[i];
			this.y[i] += this.sY[i];
			if (Math.abs(this.x[i])>this.fWidth) {
				this.sX[i] = -this.sX[i];
			}
			if (Math.abs(this.y[i])>this.fHeight) {
				this.sY[i] = -this.sY[i];
			}
		}
		this.col = 0xFF0000;
		for (i=0; i<this.numberOfPetals; i++) {
			this.drawpetal("petal"+i, this.col, 200/this.numberOfPetals);
			this.col += 0x001040;
		}
	};
	// 
	this.init = function() {
		this.x = new Array();
		this.y = new Array();
		this.sX = new Array();
		this.sY = new Array();
		this.x[0] = 0;
		this.y[0] = 0;
		this.x[1] = 0;
		this.y[1] = -this.fHeight;
		this.x[2] = -this.fWidth;
		this.y[2] = -this.fHeight;
		this.x[3] = -this.fWidth;
		this.y[3] = 0;
		for (i=0; i<4; i++) {
			this.sX[i] = Math.random()*4+2;
			this.sY[i] = Math.random()*4+2;
		}
		this.col = 0xFF0000;
	};
	this.init();
	this.createPetals(this.numberOfPetals);
	this.onEnterFrame = this.petalControl;
};
//
this.fDepth = 0;
// createFlower (flower, numberOfPetals, fWidth, fHeight, fX, fY)
createFlower("daffodil", 8, 100, 20, 200, 200);
createFlower("orchid", 3, 40, 40, 100, 200);
createFlower("daisy", 5, 40, 100, 300, 200);
