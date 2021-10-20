const Base = require('./base.js');

module.exports = class extends Base {
  /**
   * 获取公司的信用卡
   * @return {Promise} []
   */
  async listAction() {
    const cardList = await this.model('card').where({ id: this.post('merchantId') }).select();

    return this.success(cardList);
  }

  /**
   * 获取信用卡的详情
   * @return {Promise} []
   */
  async detailAction() {
    const cardId = this.get('id');

    const acardInfo = await this.model('card').where({ id: cardId }).find();

    return this.success(acardInfo);
  }

  /**
   * 添加或充值公司的信用卡
   * @returns {Promise.<Promise|PreventPromise|void>}
   */
  async saveAction() {
    let cardId = this.post('id');
    const cardData = {
      merchantId: this.post('merchantId'),
      merchantName: this.post('merchantName'),
      amount: this.post('amount'),
      cardToken: this.model('card').generateCardNumber(),
    };

    if (think.isEmpty(cardId)) {
      cardId = await this.model('card').add(cardData);
    } else {
      await this.model('card').where({id: cardId}).update(cardData);
    }

    const cardInfo = await this.model('card').where({ id: cardId }).find();

    return this.success(cardInfo);
  }

  /**
   * 删除指定的收货地址
   * @returns {Promise.<Promise|PreventPromise|void>}
   */
  async deleteAction() {
    const cardId = this.post('id');

    await this.model('card').where({ id: cardId }).delete();

    return this.success('删除成功');
  }
};
