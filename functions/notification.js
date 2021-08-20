/* eslint-disable */

/**
  * This is the notification class
  */
class Notification {
  constructor(id, title, body, schedule) {
    this.id = id;
    this.title = title;
    this.body = body;
    this.schedule = schedule;
  }
}

const notificationData = [
  new Notification("00", "dentist", "you should go to the dentist soon...", "* * * * *"),
  new Notification("01", "water", "remember to drink enough water", "* * * * *"),
];

module.exports = { notificationData };