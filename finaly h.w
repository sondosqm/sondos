public class GameEntry {
  protected String name; // name of the person earning this score
  protected int score; // the score value
  /** Constructor to create a game entry */
  public GameEntry(String n, int s) {
    name = n;
    score = s;
  }
  /** Retrieves the name field */
  public String getName() { return name; }
  /** Retrieves the score field */
  public int getScore() { return score; }
  /** Returns a string representation of this entry */
  public String toString() {
    return "(" + name + ", " + score + ")";
  }
}
/** Class for storing high scores in an array in non-decreasing order. */
public class Scores {
  public static final int maxEntries = 10; // number of high scores we keep
  protected int numEntries; // number of actual entries
  protected GameEntry[] entries; // array of game entries (names & scores)
  /** Default constructor */
  public Scores() {
    entries = new GameEntry[maxEntries];
    numEntries = 0;
  }
  /** Returns a string representation of the high scores list */
  public String toString() {
    String s = "[";
    for (int i = 0; i < numEntries; i++) {
      if (i > 0) s += ", "; // separate entries by commas
      s += entries[i];
    }
    return s + "]";
  }
  // ... methods for updating the set of high scores go here ...
}
/** Attempt to add a new score to the collection (if it is high enough) */
public void add(GameEntry e) {
  int newScore = e.getScore();
  // is the new entry e really a high score?
  if (numEntries == maxEntries) { // the array is full
    if (newScore <= entries[numEntries-1].getScore())
      return; // the new entry, e, is not a high score in this case
  }
  else // the array is not full
    numEntries++;
  // Locate the place that the new (high score) entry e belongs
  int i = numEntries-1;
  for ( ; (i >= 1) && (newScore > entries[i-1].getScore()); i--)
    entries[i] = entries[i - 1]; // move entry i one to the right

  entries[i] = e; // add the new score to entries
}
/** Remove and return the high score at index i */
public GameEntry remove(int i) throws IndexOutOfBoundsException {
  if ((i < 0) || (i >= numEntries))
    throw new IndexOutOfBoundsException( "Invalid index: " + i);
  GameEntry temp = entries[i]; // temporarily save the object to be removed
  for (int j = i; j < numEntries - 1; j++) // count up from i (not down)
    entries[j] = entries[j+1]; // move one cell to the left
  entries[numEntries -1 ] = null; // null out the old last score
  numEntries--;
  return temp; // return the removed object
}
/** Insertion sort of an array of characters into non-decreasing order */
public static void insertionSort(char[] a) {
  int n = a.length;
  for (int i = 1; i < n; i++) { // index from the second character in a
    char cur = a[i]; // the current character to be inserted
    int j = i - 1; // start comparing with cell left of i
    while ((j >= 0) && (a[j] > cur)) // while a[j] is out of order with cur
      a[j + 1] = a[j--]; // move a[j] right and decrement j
    a[j + 1]=cur; // this is the proper place for cur
  }
}
import java.util.Arrays;
import java.util.Random;
/** Program showing some array uses. */
public class ArrayTest {
  public static void main(String[] args) {
    int num[] = new int[10];
    Random rand = new Random(); // a pseudo-random number generator
    rand.setSeed(System.currentTimeMillis()); // use current time as a seed
    // fill the num array with pseudo-random numbers from 0 to 99, inclusive
    for (int i = 0; i < num.length; i++)
      num[i] = rand.nextInt(100); // the next pseudo-random number
    int[] old = (int[]) num.clone(); // cloning the num array
    System.out.println("arrays equal before sort: " + Arrays.equals(old,num));
    Arrays.sort(num); // sorting the num array (old is unchanged)
    System.out.println("arrays equal after sort: " + Arrays.equals(old,num));
    System.out.println("old = " + Arrays.toString(old));
    System.out.println("num = " + Arrays.toString(num));
  }
}
Import java.util.ArrayList;

/** Program showing some array uses. */
Public class ArrayListTest {
  Public static void main(String[] args) {
    ArrayList name = new ArrayList();
    Name.add(“James”);
    System.out.println(name);
    Name.add(1, “Mary”);
    System.out.println(name);
    Name.set(0, “Becky”);
    System.out.println(name);
    Name.remove(“Mary”);
    System.out.println(name);

    ArrayList iList = new ArrayList();
    iList.add(4);
    iList.add(new Integer(3));
    System.out.println(iList);
  }
}
