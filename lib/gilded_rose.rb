class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end



  def subtract_day
    @days_remaining = @days_remaining - 1
  end

  def mana_cake?
    @name == "Conjured Mana Cake"
  end

  def aged_brie?
    @name == "Aged Brie"
  end

  def backstage_pass?
    @name == "Backstage passes to a TAFKAL80ETC concert"
  end


  def ragnaros?
    @name ==  "Sulfuras, Hand of Ragnaros"
  end

  def decrease_quality
    return @quality -= 2 if mana_cake?
    @quality -= 1
  end

  def increase_quality
    return @quality += 1 if @quality < 50
  end

  def tick
    return if ragnaros?
    if !aged_brie? and !backstage_pass?
      if @quality > 0
        decrease_quality
      end
    else
      if @quality < 50
        @quality = @quality + 1
        if backstage_pass?
          if @days_remaining < 11
            increase_quality
          end
          if @days_remaining < 6
            increase_quality
          end
        end
      end
    end

    # Why is this in the middle?
    subtract_day

    if @days_remaining < 0
      if !aged_brie?
        if !backstage_pass?
          if @quality > 0
            decrease_quality
          end
        else
          @quality = @quality - @quality
        end
      else
        increase_quality
      end
    end
  end
end
