return {
  setup = function ()
    local present, impatient = pcall(require, 'impatient')
    if not present then
      print('[WARN/plugins/impatient]: Cannot import impatient, disabling cache')
    end
    impatient.enable_profile()
  end
}
