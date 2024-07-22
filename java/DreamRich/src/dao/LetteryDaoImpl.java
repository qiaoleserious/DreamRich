package dao;

import model.LetteryModel;
import util.JDBCUtil;

import java.util.List;

public class LetteryDaoImpl implements LetteryDao{

    @Override
    public List<LetteryModel> getLetteryList(int limit, String type) {
        
        try {
            JDBCUtil.getConnection();
        }catch (Exception e){

        }

        return null;
    }
}
