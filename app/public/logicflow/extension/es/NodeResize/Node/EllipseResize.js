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
import { h, EllipseNode, EllipseNodeModel } from '@logicflow/core';
import ControlGroup from '../Control/ControlGroup';
var EllipseResizeModel = /** @class */ (function (_super) {
    __extends(EllipseResizeModel, _super);
    function EllipseResizeModel(data, graphModel) {
        var _this = _super.call(this, data, graphModel) || this;
        var nodeSize = _this.properties.nodeSize;
        if (nodeSize) {
            _this.rx = nodeSize.rx;
            _this.ry = nodeSize.ry;
        }
        return _this;
    }
    EllipseResizeModel.prototype.initNodeData = function (data) {
        _super.prototype.initNodeData.call(this, data);
        this.minWidth = 30;
        this.minHeight = 30;
        this.maxWidth = 2000;
        this.maxHeight = 2000;
    };
    EllipseResizeModel.prototype.getOutlineStyle = function () {
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
    EllipseResizeModel.prototype.getResizeOutlineStyle = function () {
        return {
            stroke: '#000000',
            strokeWidth: 1,
            strokeDasharray: '3,3',
        };
    };
    EllipseResizeModel.prototype.getControlPointStyle = function () {
        return {
            width: 7,
            height: 7,
            fill: '#FFFFFF',
            stroke: '#000000',
        };
    };
    // 该方法需要在重设宽高和最大、最小限制后被调用，不建议在 initNodeData() 方法中使用
    EllipseResizeModel.prototype.enableProportionResize = function (turnOn) {
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
    return EllipseResizeModel;
}(EllipseNodeModel));
var EllipseResizeView = /** @class */ (function (_super) {
    __extends(EllipseResizeView, _super);
    function EllipseResizeView() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    EllipseResizeView.prototype.getControlGroup = function () {
        var _a = this.props, model = _a.model, graphModel = _a.graphModel;
        return (h(ControlGroup, { model: model, graphModel: graphModel }));
    };
    // getResizeShape绘制图形，功能等同于基础椭圆的getShape功能，可以通过复写此方法，进行节点自定义
    EllipseResizeView.prototype.getResizeShape = function () {
        return _super.prototype.getShape.call(this);
    };
    EllipseResizeView.prototype.getShape = function () {
        var _a = this.props, model = _a.model, isSilentMode = _a.graphModel.editConfigModel.isSilentMode;
        return (h("g", null,
            this.getResizeShape(),
            model.isSelected && !isSilentMode ? this.getControlGroup() : ''));
    };
    return EllipseResizeView;
}(EllipseNode));
var EllipseResize = {
    type: 'ellipse',
    view: EllipseResizeView,
    model: EllipseResizeModel,
};
export default EllipseResize;
