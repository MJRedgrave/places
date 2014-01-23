class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|

    	t.string :title
    	t.string :post_code
    	t.string :plan
    	t.float :latitude
    	t.float :longitude


      t.timestamps
    end
  end
end
