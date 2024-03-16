import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Lang;

class asmallahView extends WatchUi.View {


    var MIN = 45;
    //var asmallah = ["allah", "rahman", "rahim", "malik", "qudus", "salam"];
    //var asmallah = ["الله","الرحمن","الرحيم","الملك","القدوس","السلام","المؤمن","المهيمن","العزيز","الجبار","المتكبر","الخالق","البارئ","المصور","الغفار","القهار","الوهاب","الرزاق","الفتاح","العليم","القابض","الباسط","الخافض","الرافع","المعز","المذل","السميع","البصير","الحكم","العدل","اللطيف","الخبير","الحليم","العظيم","الغفور","الشكور","العلي","الكبير","الحفيظ","المقيت","الحسيب","الجليل","الكريم","الرقيب","المجيب","الواسع","الحكيم","الودود","المجيد","الباعث","الشهيد","الحق","الوكيل","القوي","المتين","الولي","الحميد","المحصي","المبدئ","المعيد","المحيي","المميت","الحي","القيوم","الواجد","الماجد","الواحد","الأحد","الصمد","القادر","المقتدر","المقدم","المؤخر","الأول","الآخر","الظاهر","الباطن","الوالي","المتعالي","البر","التواب","المنتقم","العفو","الرؤوف","مالك\n الملك","ذو الجلال \nوالإكرام","المقسط","الجامع","الغني","المغني","المانع","الضار","النافع","النور","الهادي","البديع","الباقي","الوارث","الرشيد","الصبور"];
    var asmallah = [];
    var duration, interval, start;
    //var count;
    var now, iter;
    var count_start = 33;
    var count_end = 126;
    var barray;

    var firstTime = true;
    var started = false;
    

    function initialize() {
        System.println("init");
        View.initialize();
        duration = MIN * 60;
        interval = duration/100;
        start = Time.now().value();
        //count = count_start;
        barray = [];

        //fillArray();
        //testFunction();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        //setLayout(Rez.Layouts.MainLayout(dc));
        var mainTimer = new Timer.Timer();
        mainTimer.start(method(:callback), interval*1000, true);

        var flashlightTimerTimer = new Timer.Timer();
        flashlightTimerTimer.start(method(:turnoffLightTimer), 2000, false);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    //! Callback for main timer
    public function callback() as Void {
        //System.println("callback");
        //count++;
        started = true;
        Attention.backlight(0.5);
        WatchUi.requestUpdate();
    }

    //! Callback for flashlighttimer
    public function turnoffLight() as Void {
        Attention.backlight(0.0);
    }

        //! Callback for flashlighttimer
    public function turnoffLightTimer() as Void {
        var flashlightTimer = new Timer.Timer();
        flashlightTimer.start(method(:turnoffLight), interval*1000, true);
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        if(firstTime or started){
            firstTime = false;
            System.println("onupdate");
            // Call the parent onUpdate function to redraw the layout
            //View.onUpdate(dc);
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
            dc.clear();
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            dc.drawText(dc.getWidth()/2, dc.getHeight()/2, WatchUi.loadResource(Rez.Fonts.color), getByteFromArray().toChar(), Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
            //count++;
        }        
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function nextIsm(){
        //count++;
        started = true;
        WatchUi.requestUpdate();
    }
    
    function precedentIsm(){
        //count--;
        started = true;
        WatchUi.requestUpdate();
    }

    function fillArray(){
        for(var i=count_start; i<=count_end; i++){
            barray.add(i);
        }
    }

    function getByteFromArray() {
        if(barray.size()==0){
            fillArray();
        }
        var index = Math.rand()%barray.size();
        var by = barray[index];
        barray.remove(by);
        return by;
    }

    function testFunction(){
        for(var i=0; i<200; i++){
            System.println(barray.size()+"  "+getByteFromArray());
            System.println("array "+barray);
        }
    }

}