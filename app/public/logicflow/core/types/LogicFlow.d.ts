import GraphModel from './model/GraphModel';
import Dnd from './view/behavior/DnD';
import * as Options from './options';
import * as _Model from './model';
import History from './history/History';
import Tool from './tool';
import { CallbackType } from './event/eventEmitter';
import Keyboard from './keyboard';
import { EdgeConfig, EdgeFilter, NodeConfig, Extension, ComponentRender, FocusOnArgs, EdgeData, GraphConfigData, RegisterElementFn, RegisterConfig, ZoomParam, PointTuple } from './type';
import SnaplineModel from './model/SnaplineModel';
import { EditConfigInterface } from './model/EditConfigModel';
import { Theme } from './constant/DefaultTheme';
declare type GraphConfigModel = {
    nodes: _Model.BaseNodeModel[];
    edges: _Model.BaseEdgeModel[];
};
export default class LogicFlow {
    /**
     * 只读：logicflow实例挂载的容器。
     */
    container: HTMLElement;
    /**
     * 只读：画布宽度
     */
    width: number;
    /**
     * 只读：画布高度
     */
    height: number;
    /**
     * 只读：控制整个logicflow画布的model
     */
    graphModel: GraphModel;
    /**
     * 只读：控制上一步、下一步相关
     */
    history: History;
    viewMap: Map<any, any>;
    tool: Tool;
    keyboard: Keyboard;
    dnd: Dnd;
    options: Options.Definition;
    snaplineModel: SnaplineModel;
    components: ComponentRender[];
    /**
     * 个性配置的插件，覆盖全局配置的插件
     */
    plugins: Extension[];
    /**
     * 全局配置的插件，所有的LogicFlow示例都会使用
     */
    static extensions: Map<string, Extension>;
    /**
     * 插件扩展方法
     * @example
     */
    extension: Record<string, any>;
    /**
     * 自定义数据格式转换方法
     * 当接入系统格式和logicflow格式不一直的时候，可以自定义此方法来转换数据格式
     * 详情请参考adapter
     * @see todo
     */
    adapterIn: (data: unknown) => GraphConfigData;
    /**
     * 自定义数据格式转换方法
     * 把logicflow输入的格式转换也接入系统需要的格式
     * 详情请参考adapter
     * @see todo
     */
    adapterOut: (data: GraphConfigData) => unknown;
    /**
     * 支持插件在logicflow实例上增加自定义方法
     */
    [propName: string]: any;
    constructor(options: Options.Definition);
    /**
     * 注册自定义节点和边
     * 支持两种方式
     * 方式一（推荐）
     * 详情见 todo: docs link
     * @example
     * import { RectNode, RectModel } from '@logicflow/core'
     * class CustomView extends RectNode {
     * }
     * class CustomModel extends RectModel {
     * }
     * lf.register({
     *   type: 'custom',
     *   view: CustomView,
     *   model: CustomModel
     * })
     * 方式二
     * 不推荐，极个别在自定义的时候需要用到lf的情况下可以用这种方式。
     * 大多数情况下，我们可以直接在view中从this.props中获取graphModel
     * 或者model中直接this.graphModel获取model的方法。
     * @example
     * lf.register('custom', ({ RectNode, RectModel }) => {
     *    class CustomView extends RectNode {}
     *    class CustomModel extends RectModel {}
     *    return {
     *      view: CustomView,
     *      model: CustomModel
     *    }
     * })
     */
    register(type: string | RegisterConfig, fn?: RegisterElementFn, isObserverView?: boolean): void;
    private registerElement;
    /**
     * 批量注册
     * @param elements 注册的元素
     */
    batchRegister(elements?: any[]): void;
    private defaultRegister;
    /**
     * 将图形选中
     * @param id 选择元素ID
     * @param multiple 是否允许多选，如果为true，不会将上一个选中的元素重置
     * @param toFront 是否将选中的元素置顶，默认为true
     */
    selectElementById(id: string, multiple?: boolean, toFront?: boolean): void;
    /**
     * 定位到画布视口中心
     * 支持用户传入图形当前的坐标或id，可以通过type来区分是节点还是边的id，也可以不传（兜底）
     * @param focusOnArgs.id 如果传入的是id, 则画布视口中心移动到此id的元素中心点。
     * @param focusOnArgs.coordinate 如果传入的是坐标，则画布视口中心移动到此坐标。
     */
    focusOn(focusOnArgs: FocusOnArgs): void;
    /**
     * 设置主题样式
     * @param { object } style 自定义主题样式
     * todo docs link
     */
    setTheme(style: Theme): void;
    /**
     * 重新设置画布的宽高
     * 不传会自动计算画布宽高
     */
    resize(width?: number, height?: number): void;
    /**
     * 设置默认的边类型。
     * 也就是设置在节点直接有用户手动绘制的连线类型。
     * @param type Options.EdgeType
     */
    setDefaultEdgeType(type: Options.EdgeType): void;
    /**
     * 更新节点或边的文案
     * @param id 节点或者边id
     * @param value 文案内容
     */
    updateText(id: string, value: string): void;
    /**
     * 删除元素，在不确定当前id是节点还是边时使用
     * @param id 元素id
     */
    deleteElement(id: any): boolean;
    /**
     * 获取节点或边对象
     * @param id id
     */
    getModelById(id: string): _Model.BaseNodeModel | _Model.BaseEdgeModel;
    /**
     * 获取节点或边的数据
     * @param id id
     */
    getDataById(id: string): NodeConfig | EdgeConfig;
    /**
     * 修改指定节点类型
     * @param id 节点id
     * @param type 节点类型
     */
    changeNodeType(id: string, type: string): void;
    /**
     * 切换边的类型
     * @param id 边Id
     * @param type 边类型
     */
    changeEdgeType(id: string, type: string): void;
    /**
     * 获取节点连接的所有边的model
     * @param nodeId 节点ID
     * @returns model数组
     */
    getNodeEdges(nodeId: any): _Model.BaseEdgeModel[];
    /**
     * 添加节点
     * @param nodeConfig 节点配置
     */
    addNode(nodeConfig: NodeConfig): _Model.BaseNodeModel;
    /**
     * 删除节点
     * @param {string} nodeId 节点Id
     */
    deleteNode(nodeId: string): boolean;
    /**
     * 克隆节点
     * @param nodeId 节点Id
     */
    cloneNode(nodeId: string): _Model.BaseNodeModel;
    /**
     * 修改节点的id， 如果不传新的id，会内部自动创建一个。
     * @param { string } oldId 将要被修改的id
     * @param { string } newId 可选，修改后的id
     * @returns 修改后的节点id, 如果传入的oldId不存在，返回空字符串
     */
    changeNodeId<T extends string>(oldId: string, newId?: T): T | string;
    /**
     * 获取节点对象
     * @param nodeId 节点Id
     */
    getNodeModelById(nodeId: string): _Model.BaseNodeModel;
    /**
     * 获取节点数据
     * @param nodeId 节点
     */
    getNodeDataById(nodeId: string): NodeConfig;
    /**
     * 给两个节点之间添加一条边
     * @example
     * lf.addEdge({
     *   type: 'polygon'
     *   sourceNodeId: 'node_id_1',
     *   targetNodeId: 'node_id_2',
     * })
     * @param {object} edgeConfig
     */
    addEdge(edgeConfig: EdgeConfig): _Model.BaseEdgeModel;
    /**
     * 删除边
     * @param {string} edgeId 边Id
     */
    deleteEdge(edgeId: string): boolean;
    /**
     * 删除指定类型的边, 基于边起点和终点，可以只传其一。
     * @param config.sourceNodeId 边的起点节点ID
     * @param config.targetNodeId 边的终点节点ID
     */
    deleteEdgeByNodeId(config: {
        sourceNodeId?: string;
        targetNodeId?: string;
    }): void;
    /**
     * 修改边的id， 如果不传新的id，会内部自动创建一个。
     * @param { string } oldId 将要被修改的id
     * @param { string } newId 可选，修改后的id
     * @returns 修改后的节点id, 如果传入的oldId不存在，返回空字符串
     */
    changeEdgeId<T extends string>(oldId: string, newId?: T): T | string;
    /**
     * 基于边Id获取边的model
     * @param edgeId 边的Id
     * @return model
     */
    getEdgeModelById(edgeId: string): _Model.BaseEdgeModel;
    /**
     * 获取满足条件边的model
     * @param edgeFilter 过滤条件
     * @example
     * 获取所有起点为节点A的边的model
     * lf.getEdgeModels({
     *   sourceNodeId: 'nodeA_id'
     * })
     * 获取所有终点为节点B的边的model
     * lf.getEdgeModels({
     *   targetNodeId: 'nodeB_id'
     * })
     * 获取起点为节点A，终点为节点B的边
     * lf.getEdgeModels({
     *   sourceNodeId: 'nodeA_id',
     *   targetNodeId: 'nodeB_id'
     * })
     * @return model数组
     */
    getEdgeModels(edgeFilter: EdgeFilter): _Model.BaseEdgeModel[];
    /**
     * 基于id获取边数据
     * @param edgeId 边Id
     * @returns EdgeData
     */
    getEdgeDataById(edgeId: string): EdgeData;
    /**
     * 获取所有以此节点为终点的边
     */
    getNodeIncomingEdge(nodeId: any): any[];
    /**
     * 获取所有以此节点为起点的边
     */
    getNodeOutgoingEdge(nodeId: any): any[];
    /**
     * 获取节点连接到的所有起始节点
     */
    getNodeIncomingNode(nodeId: any): any[];
    /**
     * 获取节点连接到的所有目标节点
     */
    getNodeOutgoingNode(nodeId: any): any[];
    /**
     * 显示节点、连线文本编辑框
     * @param id 元素id
     */
    editText(id: string): void;
    /**
     * 设置元素的自定义属性
     * @see todo docs link
     * @param id 元素的id
     * @param properties 自定义属性
     */
    setProperties(id: string, properties: Object): void;
    deleteProperty(id: string, key: string): void;
    /**
     * 获取元素的自定义属性
     * @param id 元素的id
     * @returns 自定义属性
     */
    getProperties(id: string): Object;
    /**
     * 将某个元素放置到顶部。
     * 如果堆叠模式为默认模式，则将原置顶元素重新恢复原有层级。
     * 如果堆叠模式为递增模式，则将需指定元素zIndex设置为当前最大zIndex + 1。
     * @see todo link 堆叠模式
     * @param id 元素Id
     */
    toFront(id: any): void;
    /**
     * 设置元素的zIndex.
     * 注意：默认堆叠模式下，不建议使用此方法。
     * @see todo link 堆叠模式
     * @param id 元素id
     * @param zIndex zIndex的值，可以传数字，也支持传入'top' 和 'bottom'
     */
    setElementZIndex(id: string, zIndex: number | 'top' | 'bottom'): void;
    /**
     * 添加多个元素, 包括边和节点。
     */
    addElements({ nodes, edges }: GraphConfigData): GraphConfigModel;
    /**
     * 获取指定区域内的所有元素，此区域必须是DOM层。
     * 例如鼠标绘制选区后，获取选区内的所有元素。
     * @see todo 分层
     * @param leftTopPoint 区域左上角坐标, dom层坐标
     * @param rightBottomPoint 区域右下角坐标，dom层坐标
     */
    getAreaElement(leftTopPoint: PointTuple, rightBottomPoint: PointTuple, wholeEdge?: boolean, wholeNode?: boolean, ignoreHideElement?: boolean): any[];
    /**
     * 获取选中的元素数据
     * @param isIgnoreCheck 是否包括sourceNode和targetNode没有被选中的边,默认包括。
     * 注意：复制的时候不能包括此类边, 因为复制的时候不允许悬空的边。
     */
    getSelectElements(isIgnoreCheck?: boolean): GraphConfigData;
    /**
     * 将所有选中的元素设置为非选中
     */
    clearSelectElements(): void;
    /**
     * 获取流程绘图数据
     * 注意: getGraphData返回的数据受到adapter影响，所以其数据格式不一定是logicflow内部图数据格式。
     * 如果实现通用插件，请使用getGraphRawData
     */
    getGraphData(): GraphConfigData | any;
    /**
     * 获取流程绘图原始数据
     * 在存在adapter时，可以使用getGraphRawData获取图原始数据
     */
    getGraphRawData(): GraphConfigData;
    /**
     * 清空画布
     */
    clearData(): void;
    /**
     * 更新流程图编辑相关设置
     * @param {object} config 编辑配置
     * @see todo docs link
     */
    updateEditConfig(config: EditConfigInterface): void;
    /**
     * 获取流程图当前编辑相关设置
     * @see todo docs link
     */
    getEditConfig(): Partial<_Model.EditConfigModel>;
    /**
     * 获取事件位置相对于画布左上角的坐标
     * 画布所在的位置可以是页面任何地方，原生事件返回的坐标是相对于页面左上角的，该方法可以提供以画布左上角为原点的准确位置。
     * @see todo link
     * @param {number} x 事件x坐标
     * @param {number} y 事件y坐标
     * @returns {object} Point 事件位置的坐标
     * @returns {object} Point.domOverlayPosition HTML层上的坐标
     * @returns {object} Point.canvasOverlayPosition SVG层上的坐标
     */
    getPointByClient(x: number, y: number): {
        domOverlayPosition: {
            x: number;
            /**
             * 将图形选中
             * @param id 选择元素ID
             * @param multiple 是否允许多选，如果为true，不会将上一个选中的元素重置
             * @param toFront 是否将选中的元素置顶，默认为true
             */
            y: number;
        };
        canvasOverlayPosition: {
            x: number;
            y: number;
        };
    };
    /**
     * 历史记录操作
     * 返回上一步
     */
    undo(): void;
    /**
     * 历史记录操作
     * 恢复下一步
     */
    redo(): void;
    /**
     * 放大缩小图形
     * @param zoomSize 放大缩小的值，支持传入0-n之间的数字。小于1表示缩小，大于1表示放大。也支持传入true和false按照内置的刻度放大缩小
     * @param point 缩放的原点
     * @returns {string} -放大缩小的比例
     */
    zoom(zoomSize?: ZoomParam, point?: PointTuple): string;
    /**
     * 重置图形的放大缩写比例为默认
     */
    resetZoom(): void;
    /**
     * 设置图形缩小时，能缩放到的最小倍数。参数为0-1自己。默认0.2
     * @param size 图形缩小的最小值
     */
    setZoomMiniSize(size: number): void;
    /**
     * 设置图形放大时，能放大到的最大倍数，默认16
     * @param size 图形放大的最大值
     */
    setZoomMaxSize(size: number): void;
    /**
     * 获取缩放的值和平移的值。
     */
    getTransform(): {
        SCALE_X: number;
        SCALE_Y: number;
        TRANSLATE_X: number;
        TRANSLATE_Y: number;
    };
    /**
     * 平移图
     * @param x 向x轴移动距离
     * @param y 向y轴移动距离
     */
    translate(x: number, y: number): void;
    /**
     * 还原图形为初始位置
     */
    resetTranslate(): void;
    /**
     * 图形画布居中显示
     */
    translateCenter(): void;
    /**
     * 图形适应屏幕大小
     * @param verticalOffset number 距离盒子上下的距离， 默认为20
     * @param horizontalOffset number 距离盒子左右的距离， 默认为20
     */
    fitView(verticalOffset?: number, horizontalOffset?: number): void;
    /**
     * 开启边的动画
     * @param edgeId any
     */
    openEdgeAnimation(edgeId: any): void;
    /**
     * 关闭边的动画
     * @param edgeId any
     */
    closeEdgeAnimation(edgeId: any): void;
    /**
     * 监听事件
     * 事件详情见 @see todo
     * 支持同时监听多个事件
     * @example
     * lf.on('node:click,node:contextmenu', (data) => {
     * });
     */
    on(evt: string, callback: CallbackType): void;
    /**
     * 撤销监听事件
     */
    off(evt: string, callback: CallbackType): void;
    /**
     * 监听事件，只监听一次
     */
    once(evt: string, callback: CallbackType): void;
    /**
     * 触发监听事件
     */
    emit(evt: string, arg: any): void;
    /**
     * 添加扩展, 待讨论，这里是不是静态方法好一些？
     * 重复添加插件的时候，把上一次添加的插件的销毁。
     * @param plugin 插件
     */
    static use(extension: Extension): void;
    private installPlugins;
    /**
     * 加载插件-内部方法
     */
    private installPlugin;
    /**
     * 修改对应元素 model 中的属性
     * 注意：此方法慎用，除非您对logicflow内部有足够的了解。
     * 大多数情况下，请使用setProperties、updateText、changeNodeId等方法。
     * 例如直接使用此方法修改节点的id,那么就是会导致连接到此节点的边的sourceNodeId出现找不到的情况。
     * @param {string} id 元素id
     * @param {object} attributes 需要更新的属性
     */
    updateAttributes(id: string, attributes: object): void;
    /**
     * 内部保留方法
     * 创建一个fakerNode，用于dnd插件拖动节点进画布的时候使用。
     */
    createFakerNode(nodeConfig: any): any;
    /**
     * 内部保留方法
     * 移除fakerNode
     */
    removeFakerNode(): void;
    /**
     * 内部保留方法
     * 用于fakerNode显示对齐线
     */
    setNodeSnapLine(data: any): void;
    /**
     * 内部保留方法
     * 用于fakerNode移除对齐线
     */
    removeNodeSnapLine(): void;
    /**
     * 内部保留方法
     * 用于fakerNode移除对齐线
     */
    setView(type: string, component: any): void;
    renderRawData(graphRawData: any): void;
    /**
     * 渲染图
     * @example
     * lf.render({
     *   nodes: [
     *     {
     *       id: 'node_1',
     *       type: 'rect',
     *       x: 100,
     *       y: 100
     *     },
     *     {
     *       id: 'node_2',
     *       type: 'circel',
     *       x: 300,
     *       y: 200
     *     }
     *   ],
     *   edges: [
     *     {
     *       sourceNodeId: 'node_1',
     *       targetNodeId: 'node_2',
     *       type: 'polyline'
     *     }
     *   ]
     * })
     * @param graphData 图数据
     */
    render(graphData?: {}): void;
    /**
     * 内部保留方法
     * 获取指定类型的view
     */
    getView: (type: string) => any;
}
export {};
