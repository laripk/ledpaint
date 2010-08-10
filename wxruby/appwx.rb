require 'rubygems'
require 'wx'
require 'wx_sugar/all'

require 'mainwindow'


class AppWx < Wx::App
  def on_init
    @mn = MainWindow.new
    @mn.show(true)
  end
end


AppWx.new.main_loop