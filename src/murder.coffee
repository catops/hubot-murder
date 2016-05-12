# Description
#   Kill your Hubot
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET - Describe any optional/required environment variables.
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Chris Contolini

messages =
  birth: [
    "I'm baaaaaaaaack. :godmode:"
    "Back from the dead. :angel:"
    "Bot reporting in. :muscle:"
    "I missed you :couplekiss:"
  ]
  death: [
    "Et tu, brute? :sob:"
    "Not cool. :suspect:"
    "See ya later. :rage1:"
    "You'll pay for this. :goberserk:"
  ]

randMsg = (arr) ->
  return arr[Math.floor(Math.random() * arr.length)]

class MurderRobot
  constructor: (@robot) ->
    @murderScene = @robot.brain.get('murderScene') or {}
    robot.messageRoom @murderScene.placeOfDeath, randMsg messages.birth if @murderScene.placeOfDeath
  kill: (res) ->
    @murderScene.timeOfDeath = Date.now()
    @murderScene.placeOfDeath = res.envelope.room
    @robot.brain.set 'murderScene', @murderScene

module.exports = (robot) ->
  murderRobot = new MurderRobot robot

  robot.respond /(die|restart|reboot)/, (res) ->
    murderRobot.kill res
    res.send randMsg messages.death
    setTimeout () ->
      process.exit 0
    , 500
