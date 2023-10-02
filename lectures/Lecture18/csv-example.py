# csv-example.py : Parsing example for CSV files

# Imported Python files
import csv
import time 
import codecs
import json
import datetime
import statistics
import sys

# Track the number of unique instances of a given string and then for each entry,
# maintain a count of how many times it occurs
#
# TrackDictionary - The dictionary used to record unique instances via keys
# TrackString     - The string that is being tracked for uniqueness
def TrackAndCount (TrackDictionary, TrackString):
    if(TrackString in TrackDictionary.keys()):
        # The string is already there, increment its count by one
        TrackDictionary[TrackString]['Count'] += 1
    else:
        # The string to look at its uniqueness does not exist
        #  -> Add it to the list of keys
        #  -> Initialize the count to 1
        TrackDictionary[TrackString] = {}
        TrackDictionary[TrackString]['Count'] = 1

# Presuming a set of numeric values as the key
def SummarizeStatistics (TrackDictionary,MaxValueFilter):
    TheDataArray = []

    for TheKey in TrackDictionary.keys():
        for TheIter in range(TrackDictionary[TheKey]['Count']):
            if(TheKey != '(null)'):
                TheDataArray.append(int(TheKey))


    print('    Unique Values: ' + str(len(TrackDictionary.keys())))
    print('    Mean:          ' + str(statistics.mean(TheDataArray)))
    print('    Median:        ' + str(statistics.median(TheDataArray)))
    print('    Modes:         ' + str(statistics.multimode(TheDataArray)))
    print('    Std Dev:       ' + str(statistics.stdev(TheDataArray)))

    Quartiles = statistics.quantiles(TheDataArray)

    print('    Quartiles:     ' + str(Quartiles))

def SummarizeCountStatistics (TrackDictionary):
    CountArray = []

    # Construct the array of various counts
    for TheKey in TrackDictionary.keys():    
        CountArray.append(TrackDictionary[TheKey]['Count'])

    print('  Count Statistics')
    print('    Entries:       ' + str(len(CountArray)))
    print('    Total Count:   ' + str(sum(CountArray)))
    print('    Mean:          ' + str(statistics.mean(CountArray)))
    print('    Median:        ' + str(statistics.median(CountArray)))
    print('    Modes:         ' + str(statistics.multimode(CountArray)))
    print('    Std Dev:       ' + str(statistics.stdev(CountArray)))
    print('    Quartiles:     ' + str(statistics.quantiles(CountArray)))

def ParseFileIntoRecords (TheFile, TheEntry, MaxRecordParse):
    start = time.time()
    startstart = time.time()
    print('Parsing ' + TheFile)

    RecordCount = 0
    LineNumber = 0

    with open(TheFile,'r',newline='') as csvfile:
        TheReader = csv.DictReader(csvfile,quoting=csv.QUOTE_NONE)
        for row in TheReader:        
            LineNumber += 1

            if(MaxRecordParse != -1 and LineNumber >= MaxRecordParse):
                print(' Processed ' + str(LineNumber) + ' lines from ' + TheFile)
                break

            if(LineNumber % 100000 == 0):
                end = time.time()
                print(' 100k records took ' + str(end - start) + ' seconds')
                start = time.time()

            RecordCount += 1

            # For the first data row, we need to put everything into our various 
            # tracking dictionaries that capture unique strings / values
            if(RecordCount == 1):
                for TheKey in row.keys():
                    TheEntry[TheKey] = {}

            # Now parse the actual data row
            for TheKey in row.keys():
                TrackAndCount(TheEntry[TheKey],row[TheKey])


    print('Total Records Parsed: ' + str(RecordCount))
    print('')
    return RecordCount

NumArgs = len(sys.argv)

if(NumArgs == 1):
    print('Expected at least 1 argument, the file or files to parse')
    exit()

FilesToParse = []

for TheArgument in sys.argv[1:]:
    FilesToParse.append(TheArgument)

# Define the base dictionary
TrackedFields = {}
RecordTally = 0

for TheFile in FilesToParse:
    RecordTally += ParseFileIntoRecords(TheFile,TrackedFields,-1)

# Output the data in an easy to follow copy / paste for a CSV
print('')
print('CSV Summary')
print('')

TheOut = 'Field,IsBlank,IsZero,Most,MostCount,MostPct,Second,SecondCount,SecondPct'
print(TheOut)

for TheKey in TrackedFields.keys():
    TheOut = TheKey + ','

    BlankCount = 0
    ZeroCount = 0

    MostCount = 0
    MostValue = ''

    SecondCount = 0
    SecondValue = ''

    for TheSubKey in TrackedFields[TheKey].keys():
        if(TheSubKey == ''):
            BlankCount = TrackedFields[TheKey][TheSubKey]['Count']
        elif (TheSubKey == '0'):
            ZeroCount = TrackedFields[TheKey][TheSubKey]['Count']

        if(TrackedFields[TheKey][TheSubKey]['Count'] > MostCount):
            SecondCount = MostCount
            SecondValue = MostValue

            MostCount = TrackedFields[TheKey][TheSubKey]['Count']
            MostValue = TheSubKey
        elif(TrackedFields[TheKey][TheSubKey]['Count'] > SecondCount):
            SecondCount = TrackedFields[TheKey][TheSubKey]['Count']
            SecondValue = TheSubKey
        
    if(MostCount > 0):
        MostPct = float(MostCount) / RecordTally * 100.0
    else:
        MostPct = 0.0

    if(SecondCount > 0):
        SecondPct = float(SecondCount) / RecordTally * 100.0
    else:
        SecondPct = 0.0

    print(TheKey + ',' + str(BlankCount) + ',' + str(ZeroCount) + ',' + MostValue + ',' + str(MostCount) + ',' + str(MostPct) + ',' + SecondValue + ',' + str(SecondCount) + ',' + str(SecondPct))
