class TagAggregator
  def self.run
    Article.where(:tags.exists=>true, published: true).map_reduce(map_js,reduce_js).out(replace: 'tags').to_a
  end

  private

  def self.map_js
    <<-MAP
      function(){
        this.tags.forEach(function(z){          
          emit(z,1);
        })
      }
    MAP
  end

  def self.reduce_js
    <<-REDUCE
      function (key,values){
        var total=0;
        for(var i=0;i<values.length;i++){
          total += values[i];
        };
        return total;
      }
    REDUCE
  end
end