function point() {
	// General function to rotate a clip to a point (targetX, targetY).
	//For this example, the target is the mouse.
	this.targetX = _root._xmouse;
	this.targetY = _root._ymouse;
	if (this.targetX>this._x) {
		// quadrant 1 or 2
		if (this.targetY<this._y) {
			// quadrant 1
			this.targetAngle = 0;
		} else {
			// quadrant 2
			this.targetAngle = 90;
		}
	} else {
		// quadrant 3 or 4
		if (this.targetY<this._y) {
			// quadrant 4
			this.targetAngle = 270;
		} else {
			// quadrant 3
			this.targetAngle = 180;
		}
	}
	// now calculate tan or remaining angle 'addangle'
	this.adjacent = this._x-this.targetX;
	this.opposite = this._y-this.targetY;
	if ((this.adjacent == 0) || (this.opposite == 0)) {
		this.tang = 0;
	} else {
		this.tang = this.opposite/this.adjacent;
		if (this.tang<0) {
			this.tang = 1/this.tang;
		}
		this.tang = Math.abs(this.tang);
	}
	if (this.tang>5.67) {
		this.addAngle = 80;
	} else if (this.tang>2.75) {
		this.addAngle = 70;
	} else if (this.tang>1.73) {
		this.addAngle = 60;
	} else if (this.tang>1.19) {
		this.addAngle = 50;
	} else if (this.tang>0.84) {
		this.addAngle = 40;
	} else if (this.tang>0.58) {
		this.addAngle = 30;
	} else if (this.tang>0.36) {
		this.addAngle = 20;
	} else if (this.tang>0.18) {
		this.addAngle = 10;
	} else {
		this.addAngle = 0;
	}
	this.targetAngle = this.targetAngle+this.addAngle+5;
	this.errorAngle = this.targetAngle-this.a;
	if (Math.abs(this.errorAngle)>5) {
		if ((this.errorAngle>0) && (this.errorAngle<180) || (this.errorAngle<-180)) {
			this.a = this.a+5;
		} else {
			this.a = this.a-5;
		}
	}
	if (this.a>360) {
		this.a = this.a-360;
	}
	if (this.a<0) {
		this.a = this.a+360;
	}
	this._rotation = this.a;
}

