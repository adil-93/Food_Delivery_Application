package com.tap.DAO;

import java.util.List;
import com.tap.model.Menu;   // REQUIRED import

public interface MenuDAO {

    void addMenu(Menu menu);

    Menu getMenu(int menuId);

    void updateMenu(Menu menu);

    void deleteMenu(int menuId);

    List<Menu> getAllMenusByRestaurant(int restaurantId);
}
