package cz.vity.freerapid.core;

import cz.vity.freerapid.core.application.GlobalEDTExceptionHandler;
import cz.vity.freerapid.core.application.ListItemsConvertor;
import cz.vity.freerapid.core.tasks.CheckForNewVersionTask;
import cz.vity.freerapid.gui.managers.ManagerDirector;
import cz.vity.freerapid.swing.LookAndFeels;
import cz.vity.freerapid.swing.Swinger;
import cz.vity.freerapid.swing.TrayIconSupport;
import cz.vity.freerapid.utilities.LogUtils;
import cz.vity.freerapid.utilities.Utils;
import org.jdesktop.appframework.swingx.SingleXFrameApplication;
import org.jdesktop.application.Application;
import org.jdesktop.application.ApplicationContext;
import org.jdesktop.application.ResourceConverter;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowEvent;
import java.util.EventObject;
import java.util.List;
import java.util.Map;


/**
 * Hlavni trida aplikace
 *
 * @author Vity
 */
public class MainApp extends SingleXFrameApplication {

    private ManagerDirector director;
    static boolean debug = false;
    private TrayIconSupport trayIconSupport = null;
    private AppPrefs appPrefs;

    private boolean minimizeOnStart = false;

//    private static Logger logger = null;


    @Override
    protected void initialize(String[] args) {

        final CmdLine line = new CmdLine(this);
        final List<String> fileList = line.processCommandLine(args);

        LogUtils.initLogging((debug) ? Consts.LOGDEBUG : Consts.LOGDEFAULT);//logovani nejdrive    

        minimizeOnStart = line.isMinimize();

        final Map<String, String> map = line.getProperties();
        if (Utils.isWindows() && (new java.io.File("C:/Program files/Eset").exists() || new java.io.File("D:/Program files/Eset").exists())) {
            if (!map.containsKey(FWProp.ONEINSTANCE)) {
                java.util.logging.Logger logger = java.util.logging.Logger.getLogger(MainApp.class.getName());
                logger.info("Detecting ESET - disabling OneInstance functionality");
                map.put(FWProp.ONEINSTANCE, "false");
            }
        }

        try {
            this.appPrefs = new AppPrefs(this.getContext(), map, line.isResetOptions());
        } catch (IllegalStateException e) {
            exitWithErrorMessage("Fatal Error - not all required libraries are available.\nYou probably didn't extract the zip file properly.\nYou have to have /lib directory with all libraries in the FreeRapid directory.\nExiting.");
        }

        checkBugs();


        System.getProperties().put("arguments", args);

        if (OneInstanceClient.checkInstance(fileList, appPrefs, getContext())) {
            this.exit();
            return;
        }

        Lng.loadLangProperties();

        LookAndFeels.getInstance().loadLookAndFeelSettings();//inicializace LaFu, musi to byt pred vznikem hlavniho panelu
        //Swinger.initLaF(); //inicializace LaFu, musi to byt pred vznikem hlavniho panelu
        super.initialize(args);

        ResourceConverter.register(new ListItemsConvertor());
        this.getContext().getTaskMonitor().setAutoUpdateForegroundTask(false);
    }

    private void checkBugs() {
        final String path = Utils.getAppPath();//Utils pouzivaji AppPrefs i logovani
        int index = path.indexOf('+');
        if (index == -1)
            index = path.indexOf("!/");
        if (index == -1)
            index = path.indexOf("!\\");

        if (index > 0 || path.endsWith("!")) {
            exitWithErrorMessage("errorInvalidPath", path.substring(0, index + 1));
        }
    }

    private void exitWithErrorMessage(final String s, final Object... args) {
        java.util.logging.Logger logger = java.util.logging.Logger.getLogger(MainApp.class.getName());
        logger.severe(s);
        Swinger.showErrorMessage(this.getContext().getResourceMap(), s, args);
        System.exit(-1);
    }


    @Override
    protected void startup() {
        super.startup();
        director = new ManagerDirector(getContext());
        director.initComponents();
        UIStringsManager.load(this.getContext().getResourceManager());
        initMainFrame();
        this.addExitListener(new MainAppExitListener());
        //this.getContext().getLocalStorage().load()
        final JFrame mainFrame = getMainFrame();
        show(mainFrame);
        getTrayIconSupport().setVisibleByDefault();
        setGlobalEDTExceptionHandler();

        if (minimizeOnStart)
            Swinger.minimize(mainFrame);
    }

    private void initMainFrame() {
        final JFrame frame = getMainFrame();
        if (AppPrefs.getProperty(FWProp.DECORATED_FRAMES, false)) {
            JFrame.setDefaultLookAndFeelDecorated(true);
            frame.setUndecorated(true);
            frame.getRootPane().setWindowDecorationStyle(JRootPane.FRAME);
            LookAndFeels.updateWindowUI(frame);
            JDialog.setDefaultLookAndFeelDecorated(true);
        }

        frame.setJMenuBar(director.getMenuManager().getMenuBar());
        frame.setContentPane(director.getComponent());
        frame.setMinimumSize(new Dimension(30, 30));
        frame.pack();

        if (AppPrefs.getProperty(FWProp.NEW_VERSION, true) && !debug)
            startCheckNewVersion();
    }


    private void setGlobalEDTExceptionHandler() {
        final GlobalEDTExceptionHandler eh = new GlobalEDTExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(eh);
        Thread.currentThread().setUncaughtExceptionHandler(eh);
    }

    @Override
    protected void injectSessionProperties() {
        super.injectSessionProperties();
//        SessionStorage storage = getContext().getSessionStorage();
//        storage.putProperty(JXStatusBar.class, new StorageProperties.XStatusBarProperty());
//        storage.putProperty(JToolBar.class, new StorageProperties.JToolbarProperty());
//        storage.putProperty(JXMultiSplitPane.class, new StorageProperties.XMultipleSplitPaneProperty());
//        new StorageProperties().registerPersistenceDelegates();
    }

    /**
     * Vraci komponentu hlavniho panelu obsahujici dalsi komponenty
     *
     * @return hlavni panel
     */
    public ManagerDirector getManagerDirector() {
        assert director != null; //calling getMainPanel before finished initialization
        return director;
    }

    /**
     * Hlavni spousteci metoda programu
     *
     * @param args vstupni parametry pro program
     */
    public static void main(String[] args) {
        //zde prijde overovani vstupnich pridavnych parametru
        Application.launch(MainApp.class, args); //spusteni
    }

    public static ApplicationContext getAContext() {
        return Application.getInstance(MainApp.class).getContext();
    }


    private void startCheckNewVersion() {

        final Thread appThread = new Thread() {
            public void run() {
                try {
                    Thread.sleep(30000);
                    MainApp.this.getContext().getTaskService().execute(new CheckForNewVersionTask(false));
                } catch (InterruptedException e) {
                    //ignore
                }
            }
        };
        appThread.setPriority(Thread.MIN_PRIORITY);
        appThread.start();
    }


    /**
     * Exit listener. Pri ukoncovani provede ulozeni uzivatelskych properties.
     */
    private class MainAppExitListener implements Application.ExitListener {

        public boolean canExit(EventObject event) {
            if (AppPrefs.getProperty(FWProp.MINIMIZE_ON_CLOSE, FWProp.MINIMIZE_ON_CLOSE_DEFAULT) && event instanceof WindowEvent) {
                Swinger.minimize(MainApp.this.getMainFrame());
                return false;
            }
            return true;
        }

        public void willExit(EventObject event) {
            appPrefs.store();
        }
    }

    public TrayIconSupport getTrayIconSupport() {
        if (trayIconSupport == null) {
            trayIconSupport = new TrayIconSupport();
        }
        return trayIconSupport;
    }

}
