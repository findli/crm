package JSS.w07_p01.bundle;

import java.util.ListResourceBundle;

/**
 * @author Cyril Kadomsky
 */
public class MyBundle_ru_RU extends ListResourceBundle {

    static Object[][] resource = new Object[][] {
            {"setLocale.language","����"},
            {"setLocale.select","�������� ..."},
            {"setLocale.en_US","����������"},
            {"setLocale.ru_RU","�������"},
            {"setLocale.apply","���������"},
            {"localizedPage.date","����"}
    };


    @Override
    protected Object[][] getContents() {
        return resource;
    }
}
