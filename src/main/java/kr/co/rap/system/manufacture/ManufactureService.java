package kr.co.rap.system.manufacture;

import kr.co.rap.system.model.Manufacture;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface ManufactureService {
    public List<Manufacture> viewManufactureList(Map<String, String> period);

    public Manufacture viewManufacture(Manufacture manufacture);

    public boolean addManufacture(Manufacture manufacture);

    public boolean editManufacture(Manufacture manufacture);

    public boolean removeManufacture(Manufacture manufacture);

    public boolean executeManufacture(Manufacture manufacture);
}
