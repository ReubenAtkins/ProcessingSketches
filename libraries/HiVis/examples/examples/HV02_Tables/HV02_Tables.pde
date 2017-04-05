import hivis.common.*;
import hivis.data.*;
import hivis.data.view.*;

// Examples of working with HiVis DataTables.

void setup() {
	// Get a new empty table.
	DataTable myTable = HV.newTable();
	
	// Make a couple of new series.
	// (HV.randomIntegerSeries(length, min, max) creates a new series containing randomly generated integer values.
	// (HV.randomUniformSeries(length, min, max) creates a new series containing randomly generated real values.
	DataSeries<Integer> ints = HV.randomIntegerSeries(5, 0, 10);
	DataSeries<Double> reals = HV.randomUniformSeries(5, 0, 10);
	
	
	// Add our series to our table. Each series in a table must have a unique label.
	myTable.addSeries("ints", ints);
	myTable.addSeries("reals", reals);
	
	
	// Get another table containing some series with randomly generated values, with same length as the first table.
	DataTable randomTable = HV.makeRandomTable(myTable.length());
	
	
	// Add some of the series from the random table to the first table.
	// Selecting series by label.
	myTable.addSeries("rand", randomTable.getSeries("real normal"));
	// Selecting series by index (counting from 0).
	myTable.addSeries("date", randomTable.getSeries(3));
	
	
	// Print out our table.
	println("myTable:\n" + myTable);
	
	
	// Data can be loaded from a spreadsheet file with something like (uncomment and set the file location to a real file to try it out):
	//   DataTable ssData = HV.loadSpreadSheet(new File("myspreadsheet.xlsx"));
	// The above will try to figure out where the header row is and where the data starts.
	// To specify these parameters:
	//   int sheet = 0;
	//   int headerRow = 0;
	//   int firstDataRow = 1;
	//   int firstDataColumn = 0;
	//   DataTable ssData = HV.loadSpreadSheet(new File("myspreadsheet.xlsx"), sheet, headerRow, firstDataRow, firstDataColumn);
		
	
	// Note that changes to the series after they're added to the table will be reflected in the table.
	// (By default a table stores "references" to the series it contains).
	// Here we change the first value in our "reals" series.
	reals.set(0, -5);
	println("\nmyTable reflecting changed value in 'reals' series:\n" + myTable);
	
	
	// Get some "views" of our table. A view in HiVis is a selection, rearrangement or processing 
	// of an underlying data source that will reflect changes in the data source.
	
	// We can get views of the series in a table in various ways:
	
	// Relabeling the series.
	DataTable relabelled = myTable.relabelSeries("Integers", "Reals", "Normal distribution", "Dates");
	println("\nrelabelled = myTable.relabel(\"Integers\", \"Reals\", \"Normal distribution\", \"Dates\")\n" + relabelled);
	
	// Relabeling the series by adding a prefix and/or postfix.
	// If the prefix or postfix contain '\\oi' this will be replaced by the index of the series. 
	// An '\\oi' may be followed by numerals to indicate an offset, 
	// for example "my\\oi5pf" will give labels "my5pf",  my6pf", "my7pf" and so on.
	DataTable relabelledPP = myTable.relabelSeriesPP("my ", " \\oi1");
	println("\nrelabelledPP = myTable.relabelPP(\"my\", \" \\\\oi1\")\n" + relabelledPP);
	
	// Selecting and reordering based on indices.
	// (The same can be performed using series labels instead of indices).
	DataTable selectReorder = relabelledPP.selectSeries(2, 0, 1);
	println("\nselectReorder = relabelledPP.select(2, 0, 1)\n" + selectReorder);
	
	// Selecting based on a "glob" pattern. In a glob pattern ? matches any single character and * matches zero or more of any character.
	// In the pattern below we select any series whose labels starts with "my r", followed by any number 
	// of other characters, followed by an "s", followed by two more of any other characters. 
	DataTable selectGlob = selectReorder.selectSeriesGlob("my*s??");
	println("\nselectGlob = selectReorder.selectGlob(\"my*s??\")\n" + selectGlob);
	
	// Get a DataTable view of one table appended to another:
	DataTable appended = selectGlob.append(HV.newTable().addSeries("my ints 1", HV.newIntegerSeries(100, 200)).addSeries("my reals 2", HV.newRealSeries(-1.234, -5.678)));
	println("\nappended = selectGlob.append(HV.newTable().addSeries(\"my ints 1\", HV.newIntegerSeries(100, 200)).addSeries(\"my reals 2\", HV.newRealSeries(-1.234, -5.678)))\n" + appended);
	
	// Changes to the values in the original series/table are reflected in the views:
	ints.set(0, -10);
	myTable.getSeries("reals").set(0, 100); 
	println("\nmyTable modified values\n" + myTable);
	println("\nselectGlob table reflecting modified values\n" + selectGlob);
	
	
	// Tables can be transposed. If the table contains a "row key" series containing 
	// no duplicate values it will be used for the series labels in the transposed table. 
	// (HV.mtCars() provides a DataTable containing data for ten variables over 32 automobiles extracted from the 1974 Motor Trend US magazine.)
	DataTable mtCars = HV.mtCars();
	println("\nOriginal mtCars table:\n" + mtCars);
	
	DataTable mtCarsTran = mtCars.transpose();
	
	//  The transpose() method provides a view of the underlying DataTable, so changes to this table are reflected in the view: 
	mtCars.getSeries("cyl").set(1, 12);
	
	// The "Mazda RX4 Wag" now has 12 cylinders.
	println("\nTransposed mtCars table, reflecting changed value for Mazda RX4 wag/cyl in original table:\n" + mtCarsTran);
	
	
	// Create a view of the cars table with some rows filtered out based on custom criteria.
	DataTable mtFiltered = mtCars.selectRows(new RowFilter() {
		public boolean excludeRow(DataTable input, int index) {
			// Exclude cars with 6 cylinders whose horsepower is less than 120.
			return input.getSeries("cyl").getInt(index) == 6 && input.getSeries("hp").getInt(index) < 120;
		}
	});
	println("\nmtCars table with rows filtered out (cars with 6 cylinders whose horsepower is less than 120):\n" + mtFiltered);
}


void draw() {
  
}
