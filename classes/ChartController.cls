public class ChartController {

 // Return a list of data points for a chart
public List<Data> getData() {
    return ChartController.getChartData();
}
// Make the chart data available via JavaScript remoting
@RemoteAction
public static List<Data> getRemoteData() {
    return ChartController.getChartData();
}

// The actual chart data; needs to be static to be
// called by a @RemoteAction method
public static List<Data> getChartData() {
    List<Data> data = new List<Data>();
    data.add(new Data('Jan', 30));
    data.add(new Data('Feb', 44));
    data.add(new Data('Mar', 25));
    data.add(new Data('Apr', 74));
    data.add(new Data('May', 65));
    data.add(new Data('Jun', 33));
    data.add(new Data('Jul', 92));
    data.add(new Data('Aug', 87));
    data.add(new Data('Sep', 34));
    data.add(new Data('Oct', 78));
    data.add(new Data('Nov', 80));
    data.add(new Data('Dec', 17));
    return data;
 }   
// Wrapper class
public class Data {
    public String name { get; set; }
    public Integer data1 { get; set; }
    public Data(String name, Integer data1) {
        this.name = name;
        this.data1 = data1;

    }
}
}