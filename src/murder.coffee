# Description
#   Kill your Hubot
#
# Commands:
#   hubot (die|restart|reboot) - Kills hubot
#
# Author:
#   Chris Contolini

messages =
  birth: [
    "I'm baaaaaaaaack. :godmode:"
    "I'm back from the dead. :angel:"
    "Bot reporting in. :muscle:"
    "I missed you :couplekiss:"
  ]
  death: [
    "Et tu, Brute? :sob:"
    "Ouch. BRB. :suspect:"
    "See ya later. :rage1:"
    "You'll pay for this. :goberserk: BRB."
  ]

randMsg = (arr) ->
  return arr[Math.floor(Math.random() * arr.length)]

class MurderRobot
  constructor: (@robot) ->
    murderScene = @robot.brain.data.murderScene
    if murderScene.placeOfDeath
      msg = "#{murderScene.perp}: #{randMsg messages.birth}"
      robot.messageRoom murderScene.placeOfDeath, msg
  kill: (res) ->
    murderScene =
      timeOfDeath: Date.now()
      placeOfDeath: res.envelope.room
      perp: res.envelope.user.name
    @robot.brain.data.murderScene = murderScene

module.exports = (robot) ->
  murderRobot = new MurderRobot robot

  robot.respond /(die|restart|reboot)/, (res) ->
    murderRobot.kill res
    res.send randMsg messages.death
    setTimeout () ->
      process.exit 0
    , 1000
