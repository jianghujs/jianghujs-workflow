'use strict';


// ========================================常用 require start===========================================
const Service = require('egg').Service;
const validateUtil = require("@jianghujs/jianghu/app/common/validateUtil");
const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const dayjs = require("dayjs");
const actionDataScheme = Object.freeze({
  beforHookForGenerateStudentId: {
    type: "object",
    additionalProperties: true,
    required: ["dateOfBirth"],
    properties: {
      dateOfBirth: { type: "string", format: "date" },
    },
  },
});

class StudentService extends Service {
  async beforHookForGenerateStudentId() {
    const { actionData } = this.ctx.request.body.appData;
    validateUtil.validate(
      actionDataScheme.beforHookForGenerateStudentId,
      actionData
    );
    const { dateOfBirth } = actionData;
    const dateOfBirthObj = dayjs(dateOfBirth);
    const studentId = `S_${idGenerateUtil.uuid(
      8
    )}_${dateOfBirthObj.month()}_${dateOfBirthObj.day()}`;
    this.ctx.request.body.appData.actionData.studentId = studentId;
  }

  async appendStudentInfoToUserInfo() {
    const studentInfo = await this.app
      .jianghuKnex("student")
      .where({ studentId: this.ctx.userInfo.user.userId })
      .first();
    this.ctx.userInfo.studentInfo = studentInfo || { classId: null };
  }

  async selectStudentList() {
    const studentInfo = await this.app
      .jianghuKnex("student")
      .where({ studentId: this.ctx.userInfo.user.userId })
      .first();
    const studentList = await this.app
      .jianghuKnex("student")
      .where({ classId: studentInfo.classId })
      .select();

    return {
      rows: studentList,
    };
  }
}

module.exports = StudentService;
