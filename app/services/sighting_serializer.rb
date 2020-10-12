class SightingSerializer
    def initialize(sighting_object)
        #this will take the params of a model as an object for the parameter
        @sighting = sighting_object
    end

    def to_serialized_json
        options = {
            include:  {
                bird: {
                    only: [:name, :species]
                },
                location: {
                    only: [:name, :species]
                },
            }, except: [:updated_at] 
        }
        
        
        @sighting.to_json(options)
    end

end

# Now, whatever we pass when initializing a new instance of SightingSerializer will be stored as @sighting. We will need access to this variable elsewhere in the SightingSerializer, so an instance variable is needed here.