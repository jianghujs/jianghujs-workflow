"use strict";
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
Object.defineProperty(exports, "__esModule", { value: true });
var core_1 = require("@logicflow/core");
var ControlGroup_1 = require("../Control/ControlGroup");
var Polygon_1 = require("../BasicShape/Polygon");
var DiamondResizeModel = /** @class */ (function (_super) {
    __extends(DiamondResizeModel, _super);
    function DiamondResizeModel(data, graphModel) {
        var _this = _super.call(this, data, graphModel) || this;
        var nodeSize = _this.properties.nodeSize;
        if (nodeSize) {
            _this.rx = nodeSize.rx;
            _this.ry = nodeSize.ry;
        }
        return _this;
    }
    DiamondResizeModel.prototype.initNodeData = function (data) {
        _super.prototype.initNodeData.call(this, data);
        this.minWidth = 30;
        this.minHeight = 30;
        this.maxWidth = 2000;
        this.maxHeight = 2000;
        this.gridSize = 1;
    };
    DiamondResizeModel.prototype.getOutlineStyle = function () {
        var style = _super.prototype.getOutlineStyle.call(this);
        var isSilentMode = this.graphModel.editConfigModel.isSilentMode;
        if (isSilentMode)
            return style;
        style.stroke = 'none';
        if (style.hover) {
            style.hover.stroke = 'none';
        }
        return style;
    };
    DiamondResizeModel.prototype.getResizeOutlineStyle = function () {
        return {
            stroke: '#000000',
            strokeWidth: 1,
            strokeDasharray: '3,3',
        };
    };
    DiamondResizeModel.prototype.getControlPointStyle = function () {
        return {
            width: 7,
            height: 7,
            fill: '#FFFFFF',
            stroke: '#000000',
        };
    };
    // 该方法需要在重设宽高和最大、最小限制后被调用，不建议在 initNodeData() 方法中使用
    DiamondResizeModel.prototype.enableProportionResize = function (turnOn) {
        if (turnOn === void 0) { turnOn = true; }
        if (turnOn) {
            var ResizePCT = { widthPCT: 100, hightPCT: 100 };
            var ResizeBasis = { basisWidth: this.rx, basisHeight: this.ry };
            var ScaleLimit = {
                maxScaleLimit: Math.min((this.maxWidth / (this.rx * 2)) * 100, (this.maxHeight / (this.ry * 2)) * 100),
                minScaleLimit: Math.max((this.minWidth / (this.rx * 2)) * 100, (this.minHeight / (this.ry * 2)) * 100),
            };
            this.PCTResizeInfo = { ResizePCT: ResizePCT, ResizeBasis: ResizeBasis, ScaleLimit: ScaleLimit };
        }
        else {
            delete this.PCTResizeInfo;
        }
    };
    return DiamondResizeModel;
}(core_1.DiamondNodeModel));
var DiamondResizeView = /** @class */ (function (_super) {
    __extends(DiamondResizeView, _super);
    function DiamondResizeView() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    DiamondResizeView.prototype.getControlGroup = function () {
        var _a = this.props, model = _a.model, graphModel = _a.graphModel;
        return (core_1.h(ControlGroup_1.default, { model: model, graphModel: graphModel }));
    };
    // getResizeShape绘制图形，功能等同于基础菱形的getShape功能，可以通过复写此方法，进行节点自定义
    DiamondResizeView.prototype.getResizeShape = function () {
        var model = this.props.model;
        var points = model.points;
        var style = model.getNodeStyle();
        return (core_1.h("g", null,
            core_1.h(Polygon_1.default, __assign({}, style, { points: points }))));
    };
    DiamondResizeView.prototype.getShape = function () {
        var _a = this.props, isSelected = _a.model.isSelected, isSilentMode = _a.graphModel.editConfigModel.isSilentMode;
        return (core_1.h("g", null,
            this.getResizeShape(),
            isSelected && !isSilentMode ? this.getControlGroup() : ''));
    };
    return DiamondResizeView;
}(core_1.DiamondNode));
var EllipseResize = {
    type: 'diamond',
    view: DiamondResizeView,
    model: DiamondResizeModel,
};
exports.default = EllipseResize;
