package Topic_0.Factory;

public class EmptyConnection implements NewConnection {
    @Override
    public void connect(){
        System.out.println("provider not specified");
    }
    @Override
    public void disconnect(){
        System.out.println("provider not specified");
    }

}
