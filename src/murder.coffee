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
  constructor: (robot) ->
    @robot = robot
    # Hubot's 'loaded' event fires on every save so let's just wait a few seconds instead
    setTimeout () ->
      murderScene = @robot.brain.get 'murderScene'
      # Only report back if it's been less than ten minutes
      if murderScene and murderScene.placeOfDeath and ((Date.now() - murderScene.timeOfDeath) < 600000)
        msg = "#{murderScene.perp}: #{randMsg messages.birth}"
        @robot.messageRoom murderScene.placeOfDeath, msg
    , 5000
  kill: (res) ->
    murderScene =
      timeOfDeath: Date.now()
      placeOfDeath: res.envelope.room
      perp: res.envelope.user.name
    @robot.brain.set 'murderScene', murderScene
    @robot.brain.save()

module.exports = (robot) ->
  murderRobot = new MurderRobot robot

  robot.respond /(die|restart|reboot|seppuku)/, (res) ->
    murderRobot.kill res
    res.send randMsg messages.death
    setTimeout () ->
      process.exit 0
    , 500
