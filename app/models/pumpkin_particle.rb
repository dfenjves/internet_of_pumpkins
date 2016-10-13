class PumpkinParticle
  include HTTParty

  def initialize
    @base_url = "https://api.particle.io/v1/devices/" + ENV['PARTICLE_DEVICE_ID'] + "/"
    @access_token = ENV['PARTICLE_ACCESS_TOKEN']
  end

  def print_message(message)
    new_message = message.gsub(" ", "%")
    message_post_url = @base_url + "say?access_token=#{@access_token}"
    arguments = {body: {args: new_message}}
    response = self.class.post(message_post_url, arguments)
  end

end
