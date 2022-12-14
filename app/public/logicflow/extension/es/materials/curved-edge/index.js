var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var __read = (this && this.__read) || function (o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
        while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    }
    catch (error) { e = { error: error }; }
    finally {
        try {
            if (r && !r.done && (m = i["return"])) m.call(i);
        }
        finally { if (e) throw e.error; }
    }
    return ar;
};
import { PolylineEdge, PolylineEdgeModel, h } from '@logicflow/core';
var CurvedEdge = /** @class */ (function (_super) {
    __extends(CurvedEdge, _super);
    function CurvedEdge() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    CurvedEdge.prototype.pointFilter = function (points) {
        var allPoints = points;
        var i = 1;
        while (i < allPoints.length - 1) {
            var _a = __read(allPoints[i - 1], 2), x = _a[0], y = _a[1];
            var _b = __read(allPoints[i], 2), x1 = _b[0], y1 = _b[1];
            var _c = __read(allPoints[i + 1], 2), x2 = _c[0], y2 = _c[1];
            if ((x === x1 && x1 === x2)
                || (y === y1 && y1 === y2)) {
                allPoints.splice(i, 1);
            }
            else {
                i++;
            }
        }
        return allPoints;
    };
    CurvedEdge.prototype.getEdge = function () {
        var model = this.props.model;
        var points = model.points, isAnimation = model.isAnimation, arrowConfig = model.arrowConfig, _a = model.radius, radius = _a === void 0 ? 5 : _a;
        var style = model.getEdgeStyle();
        var animationStyle = model.getEdgeAnimationStyle();
        var points2 = this.pointFilter(points.split(' ').map(function (p) { return p.split(',').map(function (a) { return Number(a); }); }));
        var _b = __read(points2[0], 2), startX = _b[0], startY = _b[1];
        var d = "M" + startX + " " + startY;
        // 1) ????????????????????????????????????????????????????????????????????????????????????????????????
        // 2) ???????????????????????????????????????
        //    ??????x????????????????????????x????????????
        //    y??????????????????y ?????????????????????y, ??? ??? ????????????y - 5????????????????????????y, ??????????????????y+5???
        //    ??????????????????????????????????????????x,y?????????????????????x????????????y?????????????????????y????????????x????????????
        for (var i = 1; i < points2.length - 1; i++) {
            var _c = __read(points2[i - 1], 2), preX = _c[0], preY = _c[1];
            var _d = __read(points2[i], 2), currentX = _d[0], currentY = _d[1];
            var _e = __read(points2[i + 1], 2), nextX = _e[0], nextY = _e[1];
            if (currentX === preX && currentY !== preY) {
                var y = currentY > preY ? currentY - radius : currentY + radius;
                d = d + " L " + currentX + " " + y;
            }
            if (currentY === preY && currentX !== preX) {
                var x = currentX > preX ? currentX - radius : currentX + radius;
                d = d + " L " + x + " " + currentY;
            }
            d = d + " Q " + currentX + " " + currentY;
            if (currentX === nextX && currentY !== nextY) {
                var y = currentY > nextY ? currentY - radius : currentY + radius;
                d = d + " " + currentX + " " + y;
            }
            if (currentY === nextY && currentX !== nextX) {
                var x = currentX > nextX ? currentX - radius : currentX + radius;
                d = d + " " + x + " " + currentY;
            }
        }
        var _f = __read(points2[points2.length - 1], 2), endX = _f[0], endY = _f[1];
        d = d + " L " + endX + " " + endY;
        var attrs = __assign(__assign(__assign({ d: d, style: isAnimation ? animationStyle : {} }, style), arrowConfig), { fill: 'none' });
        return h('path', __assign({ d: d }, attrs));
    };
    return CurvedEdge;
}(PolylineEdge));
var CurvedEdgeModel = /** @class */ (function (_super) {
    __extends(CurvedEdgeModel, _super);
    function CurvedEdgeModel() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return CurvedEdgeModel;
}(PolylineEdgeModel));
export { CurvedEdge, 
// CurvedEdgeView,
CurvedEdgeModel, };
