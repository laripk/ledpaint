require 'rubygems'
require 'wx'
require 'wx_sugar/all'


class MainWindow < Wx::Frame
  public
    def initialize()
      super(nil, :title => "LED Paint",
          :style => Wx::DEFAULT_FRAME_STYLE | Wx::TAB_TRAVERSAL,
          :size => [600,400]
        )
        setup_controls
        setup_events
    end
    
  protected
    def setup_controls
      @sizer = Wx::VBoxSizer.new
      @mainpane = self
      @mainpane.sizer = @sizer
      gridpane
      textpane
    end
    
    def gridpane
      @grd = Wx::TextCtrl.new(
          @mainpane, 
          :value => 'Type in here',
          :style => Wx::TE_MULTILINE
        )# Wx::Grid.new( @mainpane, -1, Wx::DEFAULT_POSITION, Wx::DEFAULT_SIZE )
      # grd.create_grid( 24, 24, Wx::Grid::GridSelectCells ) #creates a built-in underlying table. replace with Grid#set_table to hook up to model
      @sizer.add @grd, 2, Wx::GROW|Wx::ALL, 2

    end
    
    def textpane
      @txt = Wx::TextCtrl.new(
            @mainpane, 
            :value => 'Type in here',
            :style => Wx::TE_MULTILINE
          )
      @sizer.add @txt, 1, Wx::GROW|Wx::ALL, 2
    end

    def setup_events
    end
end