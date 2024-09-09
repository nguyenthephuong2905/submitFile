import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    @GetMapping("/places")
    public List<Place> getAllPlaces() {
        return placeService.getAllPlaces();  // Trả về danh sách các địa điểm
    }

    @PostMapping("/places")
    public Place createPlace(@RequestBody Place place) {
        placeService.addPlace(place);  // Thêm địa điểm mới vào cơ sở dữ liệu
        return place;
    }
}
