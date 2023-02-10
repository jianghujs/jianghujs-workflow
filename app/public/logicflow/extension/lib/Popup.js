
const NEXT_X_DISTANCE = 200;
const NEXT_Y_DISTANCE = 100;

class Popup {
  constructor({ lf }) {
    this.lf = lf;
    this.__popupDOM = document.createElement("div");
    this.__popupDOM.className = "lf-popup-context";
    this.__popupDOM.setAttribute("style", " background-color: rgba(0,0,0, 0.6);border-radius: 10px;color: #fff;padding: 8px;font-size: 12px;flex-direction: column;flex-wrap: wrap;max-height: 90px;position: absolute;word-break: initial;")
  }
  render(lf, container) {
    this.container = container;
    lf.on("node:click", ({ data }) => {
      this._activeData = data;
      this.createContextMenu();
      console.log(data);
    });
    lf.on("edge:click", () => {
      this.hideContextMenu();
    });
    lf.on("blank:click", () => {
      this.hideContextMenu();
    });
  }
  /**
   * 隐藏菜单
   */
  hideContextMenu() {
    this.__popupDOM.innerHTML = "";
    this.__popupDOM.style.display = "none";
    if (this.isShow) {
      this.container.removeChild(this.__popupDOM);
    }
    this.lf.off(
      "node:delete,edge:delete,node:drag,graph:transform",
      this.listenDelete
    );
    this.isShow = false;
  }
  /**
   * 显示指定元素菜单
   * @param data 节点id、节点类型、菜单位置
   */
  showContextMenu(data) {
    if (!data || !data.id) {
      console.warn("请检查传入的参数");
      return;
    }
    this._activeData = data;
    this.createContextMenu();
  }
  /**
   * 获取新菜单位置
   */
  getContextMenuPosition() {
    const data = this._activeData;
    const Model = this.lf.graphModel.getElement(data.id);
    if (!Model) {
      console.warn(`找不到元素${data.id}`);
      return;
    }
    let x;
    let y;
    if (Model.BaseType === "edge") {
      x = Number.MIN_SAFE_INTEGER;
      y = Number.MAX_SAFE_INTEGER;
      const edgeData = Model.getData();
      x = Math.max(edgeData.startPoint.x, x);
      y = Math.min(edgeData.startPoint.y, y);
      x = Math.max(edgeData.endPoint.x, x);
      y = Math.min(edgeData.endPoint.y, y);
      if (edgeData.pointsList) {
        edgeData.pointsList.forEach((point) => {
          x = Math.max(point.x, x);
          y = Math.min(point.y, y);
        });
      }
    }
    if (Model.BaseType === "node") {
      x = data.x + Model.width / 2;
      y = data.y - Model.height / 2;
    }
    return this.lf.graphModel.transformModel.CanvasPointToHtmlPoint([x, y]);
  }
  createContextMenu() {
    if(this._activeData.properties.type === 'userTask' && this._activeData.properties.userList.length > 0){
      const popupInner = document.createElement("div");
      popupInner.className = "lf-popup-inner";
      popupInner.innerHTML = this._activeData.properties.userList.join('<br>')

      this.__popupDOM.innerHTML = "";
      this.__popupDOM.appendChild(popupInner);
      this.showMenu();
    }
  }

  addNode(node, y) {
    const isDeep = y !== undefined;
    if (y === undefined) {
      y = node.y;
    }
    const nodeModel = this.lf.getNodeModelById(node.sourceId);
    const leftTopX = node.x - 100 + NEXT_X_DISTANCE;
    const leftTopY = y - node.y / 2 - 20;
    const rightBottomX = node.x + 100 + NEXT_X_DISTANCE;
    const rightBottomY = y + node.y / 2 + 20;
    const existElements = this.lf.getAreaElement(
      [leftTopX, leftTopY],
      [rightBottomX, rightBottomY]
    );
    console.log(existElements);
    if (existElements.length) {
      y = y + NEXT_Y_DISTANCE;
      this.addNode(node, y);
      return;
    }
    const newNode = this.lf.addNode({
      type: node.type,
      x: node.x + 200,
      y,
      properties: node.properties
    });
    let startPoint;
    let endPoint;
    if (isDeep) {
      startPoint = {
        x: node.x,
        y: node.y + nodeModel.height / 2
      };
      endPoint = {
        x: newNode.x - newNode.width / 2,
        y: newNode.y
      };
    }
    this.lf.addEdge({
      sourceNodeId: node.sourceId,
      targetNodeId: newNode.id,
      startPoint,
      endPoint
    });
  }

  showMenu() {
    const [x, y] = this.getContextMenuPosition();
    this.__popupDOM.style.display = "flex";
    this.__popupDOM.style.top = `${y}px`;
    this.__popupDOM.style.left = `${x + 10}px`;
    this.container.appendChild(this.__popupDOM);
    // 菜单显示的时候，监听删除，同时隐藏
    !this.isShow &&
      this.lf.on(
        "node:delete,edge:delete,node:drag,graph:transform",
        this.listenDelete
      );
    this.isShow = true;
  }

  listenDelete = () => {
    this.hideContextMenu();
  };
}

Popup.pluginName = "Popup";