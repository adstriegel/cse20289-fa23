OBJMEM = mem/MemoryPool.o mem/MemPoolCustom.o mem/MemPoolObject.o
OBJCORE = core/Main.o core/Console.o core/LogEvent.o core/Timestamp.o
OBJPKT = pkt/Packet.o  pkt/Adapter.o pkt/AdapterPCap.o pkt/InputModule.o pkt/Thread_IO.o pkt/InputLog.o pkt/OutputModule.o pkt/OutputWrite.o pkt/InputPurge.o pkt/InputPassthrough.o pkt/IOModule.o pkt/MultiIFModule.o pkt/PktSupport.o  pkt/PktQueue.o pkt/PktScheduler.o pkt/PktQueueFIFO.o  pkt/AdapterFile.o
OBJADDR = pkt/address/NetAddress.o pkt/address/NetAddressEthernet.o pkt/address/NetAddressIPv4.o pkt/address/NetAddressIPv4Subnet.o
OBJPKTSIG = pkt/PacketSignature.o pkt/PktSigMD5.o pkt/InputSignature.o pkt/PktSigXOR.o 
OBJSTMC = stmc/InputEgressVGDM.o stmc/InputIngressVGDM.o stmc/VGDM.o
OBJFILTER = pkt/Filter.o pkt/FilterRule.o pkt/FilterLayer.o
OBJXML = xml/FileXML.o xml/NodeDOM.o xml/NodeElem.o
OBJMON = mon/Monitor.o mon/Thread_Timer.o
OBJSTAT = stat/Stats.o stat/ThreadClientStat.o stat/StatManager.o
OBJUTIL = util/ip-utils.o util/mgmt.o util/tokenize.o util/PracticalSocket.o util/ParamDictionary.o util/SpookyV2.o util/802_11.o
OBJVNET = vnet/AdapterVirtual.o vnet/DelayLink.o vnet/RateLimiter.o vnet/VNetSupport.o vnet/VirtualIngress.o

OBJTEST = test/TestSupport.o test/TestTimer.o

# Sandbox objects here
OBJSANDBOX = sandbox/IOSandbox.o sandbox/SandboxSupport.o

# Special projects
OBJRIPPS  = RIPPS/RIPPS_Connection.o RIPPS/RIPPS_Host.o RIPPS/RIPPS_PktPair.o RIPPS/RIPPS_Monitor.o

OBJPCACHE = pktcache/PktCacheSupport.o pktcache/ChildCacheModule.o  pktcache/PktCacheTable.o pktcache/PCPacketFmt.o pktcache/SourceCacheModule.o

OBJPACKETCACHE = packetcache/PacketCacheModule.o packetcache/PacketCacheSupport.o packetcache/PacketCacheEntry.o packetcache/PacketCacheTable.o 

OBJTWICE = TWiCE/TWiCE_CacheTable.o TWiCE/TWiCE_ClientInfo.o TWiCE/TWiCE_Gateway.o TWiCE/TWiCE_PacketPool.o TWiCE/TWiCE_Support.o

OBJWW = whirlwind/whirlwind_gateway.o whirlwind/whirlwind_mastercache.o whirlwind/whirlwind_packetstore.o whirlwind/whirlwind_support.o

OBJFMNC = fmnc/fmnc_support.o fmnc/fmnc_manager.o fmnc/fmnc_client.o fmnc/fmnc_connection.o fmnc/fmnc_connection_tcp_slice.o fmnc/fmnc_test_sequence.o fmnc/fmnc_measurement_packet.o fmnc/fmnc_measurement_pair.o fmnc/fmnc_test_analysis.o

OBJVIZ = viz/d3js.o viz/json.o viz/vizDataPoint.o viz/vizDataSet.o

# Support Objects
OBJSUPPORT = RIPPS/RIPPS_Support.o 

OBJECTS = $(OBJMEM) $(OBJCORE) $(OBJPKT) $(OBJSTMC) $(OBJPKTSIG) $(OBJFILTER) $(OBJXML) $(OBJMON) $(OBJSTAT) $(OBJUTIL) $(OBJVNET) $(OBJSANDBOX) $(OBJTEST) $(OBJSUPPORT) $(OBJRIPPS) $(OBJADDR) $(OBJPCACHE) $(OBJFMNC) $(OBJVIZ) #$(OBJWW)

OBJPCACHEBUILD = $(OBJPCACHE) $(OBJECTS) 

OBJPACKETCACHEBUILD = $(OBJPACKETCACHE) $(OBJECTS) 

OBJTWICEBUILD = $(OBJTWICE) $(OBJECTS)

OBJWHIRLWINDBUILD = $(OBJWW) $(OBJECTS)

CC = g++ 
CCOBJ = g++ -c -std=c++0x
LIBS = -lpcap -lpthread

ScaleBox : $(OBJECTS)
	$(CC) -o ScaleBox -O $(OBJECTS) $(LIBS)

pcache : $(OBJPCACHEBUILD)
	$(CC) -o pcache -O $(OBJPCACHEBUILD) $(LIBS)

PktCache : $(OBJPACKETCACHEBUILD)
	$(CC) -o PktCache -O $(OBJPACKETCACHEBUILD) $(LIBS)

twicegw : $(OBJTWICEBUILD)
	$(CC) -o twicegw -O $(OBJTWICEBUILD) $(LIBS)

#whirlwind : $(OBJWHIRLWINDBUILD)
#	$(CC) -o whirlwind -O $(OBJWHIRLWINDBUILD) $(LIBS)


# ScaleBox core (i.e. where main is at)
core/Main.o : core/Main.cc
	$(CCOBJ) core/Main.cc -o core/Main.o

core/Console.o : core/Console.cc
	$(CCOBJ) core/Console.cc -o core/Console.o

core/LogEvent.o : core/LogEvent.cc core/LogEvent.h
	$(CCOBJ) core/LogEvent.cc -o core/LogEvent.o

core/Timestamp.o : core/Timestamp.cc core/Timestamp.h
	$(CCOBJ) core/Timestamp.cc -o core/Timestamp.o

# Memory pool
mem/MemoryPool.o : mem/MemoryPool.cc mem/MemoryPool.h
	$(CCOBJ) mem/MemoryPool.cc -o mem/MemoryPool.o

mem/MemPoolCustom.o : mem/MemPoolCustom.cc mem/MemPoolCustom.h
	$(CCOBJ) mem/MemPoolCustom.cc -o mem/MemPoolCustom.o

mem/MemPoolObject.o : mem/MemPoolObject.cc mem/MemPoolObject.h
	$(CCOBJ) mem/MemPoolObject.cc -o mem/MemPoolObject.o

# Monitor operations
mon/Monitor.o : mon/Monitor.cc mon/Monitor.h
	$(CCOBJ) mon/Monitor.cc -o mon/Monitor.o

mon/Thread_Timer.o : mon/Thread_Timer.cc mon/Thread_Timer.h
	$(CCOBJ) mon/Thread_Timer.cc -o mon/Thread_Timer.o

# Packet operations
pkt/Adapter.o : pkt/Adapter.cc pkt/Adapter.h
	$(CCOBJ) pkt/Adapter.cc -o pkt/Adapter.o

pkt/AdapterPCap.o : pkt/AdapterPCap.cc pkt/AdapterPCap.h pkt/Adapter.h
	$(CCOBJ) pkt/AdapterPCap.cc -o pkt/AdapterPCap.o

pkt/AdapterVirtual.o : pkt/AdapterVirtual.cc pkt/AdapterVirtual.h pkt/Adapter.h
	$(CCOBJ) pkt/AdapterVirtual.cc -o pkt/AdapterVirtual.o

pkt/Packet.o : pkt/Packet.cc pkt/Packet.h
	$(CCOBJ) pkt/Packet.cc -o pkt/Packet.o

pkt/IOModule.o : pkt/IOModule.cc pkt/IOModule.h
	$(CCOBJ) pkt/IOModule.cc -o pkt/IOModule.o

pkt/InputModule.o : pkt/InputModule.cc pkt/InputModule.h
	$(CCOBJ) pkt/InputModule.cc -o pkt/InputModule.o

pkt/Thread_IO.o : pkt/Thread_IO.cc pkt/Thread_IO.h pkt/Adapter.h
	$(CCOBJ) pkt/Thread_IO.cc -o pkt/Thread_IO.o

pkt/InputLog.o : pkt/InputLog.cc pkt/InputLog.h pkt/InputModule.h
	$(CCOBJ) pkt/InputLog.cc -o pkt/InputLog.o

pkt/OutputModule.o : pkt/OutputModule.cc pkt/OutputModule.h
	$(CCOBJ) pkt/OutputModule.cc -o pkt/OutputModule.o

pkt/OutputWrite.o : pkt/OutputWrite.cc pkt/OutputWrite.h pkt/OutputModule.h
	$(CCOBJ) pkt/OutputWrite.cc -o pkt/OutputWrite.o

pkt/InputPurge.o : pkt/InputPurge.cc pkt/InputPurge.h pkt/InputModule.h
	$(CCOBJ) pkt/InputPurge.cc -o pkt/InputPurge.o

pkt/InputPassthrough.o : pkt/InputPassthrough.cc pkt/InputPassthrough.h pkt/InputModule.h
	$(CCOBJ) pkt/InputPassthrough.cc -o pkt/InputPassthrough.o

pkt/MultiIFModule.o : pkt/IOModule.h pkt/MultiIFModule.h pkt/MultiIFModule.cc
	$(CCOBJ) pkt/MultiIFModule.cc -o pkt/MultiIFModule.o

pkt/PktSupport.o : pkt/PktSupport.h pkt/PktSupport.cc
	$(CCOBJ) pkt/PktSupport.cc -o pkt/PktSupport.o

pkt/AdapterFile.o : pkt/AdapterFile.h pkt/AdapterFile.cc
	$(CCOBJ) pkt/AdapterFile.cc -o pkt/AdapterFile.o

# Network address functionality

pkt/address/NetAddress.o : pkt/address/NetAddress.h pkt/address/NetAddress.cc
	$(CCOBJ) pkt/address/NetAddress.cc -o pkt/address/NetAddress.o

pkt/address/NetAddressIPv4.o : pkt/address/NetAddressIPv4.h pkt/address/NetAddressIPv4.cc
	$(CCOBJ) pkt/address/NetAddressIPv4.cc -o pkt/address/NetAddressIPv4.o

pkt/address/NetAddressEthernet.o : pkt/address/NetAddressEthernet.h pkt/address/NetAddressEthernet.cc
	$(CCOBJ) pkt/address/NetAddressEthernet.cc -o pkt/address/NetAddressEthernet.o

pkt/address/NetAddressIPv4Subnet.o : pkt/address/NetAddressIPv4Subnet.h pkt/address/NetAddressIPv4Subnet.cc
	$(CCOBJ) pkt/address/NetAddressIPv4Subnet.cc -o pkt/address/NetAddressIPv4Subnet.o


# Packet-wise signature modules

pkt/InputSignature.o : pkt/InputSignature.cc pkt/InputSignature.h 
	$(CCOBJ) pkt/InputSignature.cc -o pkt/InputSignature.o

pkt/PacketSignature.o : pkt/PacketSignature.cc pkt/PacketSignature.h 
	$(CCOBJ) pkt/PacketSignature.cc -o pkt/PacketSignature.o

pkt/PktSigMD5.o : pkt/PktSigMD5.cc pkt/PktSigMD5.h 
	$(CCOBJ) pkt/PktSigMD5.cc -o pkt/PktSigMD5.o

pkt/PktSigXOR.o : pkt/PktSigXOR.cc pkt/PktSigXOR.h 
	$(CCOBJ) pkt/PktSigXOR.cc -o pkt/PktSigXOR.o

pkt/PktQueue.o : pkt/PktQueue.cc pkt/PktQueue.h 
	$(CCOBJ) pkt/PktQueue.cc -o pkt/PktQueue.o

pkt/PktScheduler.o : pkt/PktScheduler.cc pkt/PktScheduler.h 
	$(CCOBJ) pkt/PktScheduler.cc -o pkt/PktScheduler.o

pkt/PktQueueFIFO.o : pkt/PktQueueFIFO.cc pkt/PktQueueFIFO.h 
	$(CCOBJ) pkt/PktQueueFIFO.cc -o pkt/PktQueueFIFO.o

# Packet-wise filtering

pkt/Filter.o : pkt/Filter.cc pkt/Filter.h 
	$(CCOBJ) pkt/Filter.cc -o pkt/Filter.o

pkt/FilterRule.o : pkt/FilterRule.cc pkt/FilterRule.h 
	$(CCOBJ) pkt/FilterRule.cc -o pkt/FilterRule.o

pkt/FilterLayer.o : pkt/FilterLayer.cc pkt/FilterLayer.h 
	$(CCOBJ) pkt/FilterLayer.cc -o pkt/FilterLayer.o

# Packet caching

pktcache/PktCacheSupport.o : pktcache/PktCacheSupport.cc pktcache/PktCacheSupport.h
	$(CCOBJ) pktcache/PktCacheSupport.cc -o pktcache/PktCacheSupport.o

pktcache/ChildCacheModule.o : pktcache/ChildCacheModule.cc pktcache/ChildCacheModule.h
	$(CCOBJ) pktcache/ChildCacheModule.cc -o pktcache/ChildCacheModule.o

pktcache/PktCacheTable.o : pktcache/PktCacheTable.cc pktcache/PktCacheTable.h
	$(CCOBJ) pktcache/PktCacheTable.cc -o pktcache/PktCacheTable.o	

pktcache/PCPacketFmt.o : pktcache/PCPacketFmt.cc pktcache/PCPacketFmt.h
	$(CCOBJ) pktcache/PCPacketFmt.cc -o pktcache/PCPacketFmt.o	

pktcache/SourceCacheModule.o : pktcache/SourceCacheModule.cc pktcache/SourceCacheModule.h
	$(CCOBJ) pktcache/SourceCacheModule.cc -o pktcache/SourceCacheModule.o

# Stealth multicast (stmc)

stmc/InputEgressVGDM.o : stmc/InputEgressVGDM.cc stmc/InputEgressVGDM.h
	$(CCOBJ) stmc/InputEgressVGDM.cc -o stmc/InputEgressVGDM.o

stmc/InputIngressVGDM.o : stmc/InputIngressVGDM.cc stmc/InputIngressVGDM.h
	$(CCOBJ) stmc/InputIngressVGDM.cc -o stmc/InputIngressVGDM.o

stmc/VGDM.o : stmc/VGDM.cc stmc/VGDM.h
	$(CCOBJ) stmc/VGDM.cc -o stmc/VGDM.o

# XML functionality
xml/FileXML.o : xml/FileXML.cc xml/FileXML.h 
	$(CCOBJ) xml/FileXML.cc -o xml/FileXML.o	

xml/NodeDOM.o : xml/NodeDOM.cc xml/NodeDOM.h 
	$(CCOBJ) xml/NodeDOM.cc -o xml/NodeDOM.o	

xml/NodeElem.o : xml/NodeElem.cc xml/NodeElem.h 
	$(CCOBJ) xml/NodeElem.cc -o xml/NodeElem.o	


# Stat functionality
stat/Stats.o : stat/Stats.cc stat/Stats.h
	$(CCOBJ) stat/Stats.cc -o stat/Stats.o 

stat/ThreadClientStat.o : stat/ThreadClientStat.cc stat/ThreadClientStat.h
	$(CCOBJ) stat/ThreadClientStat.cc -o stat/ThreadClientStat.o 

stat/StatManager.o : stat/StatManager.cc stat/StatManager.h
	$(CCOBJ) stat/StatManager.cc -o stat/StatManager.o 


# Utility functions
util/ip-utils.o : util/ip-utils.cc util/ip-utils.h
	$(CCOBJ) util/ip-utils.cc -o util/ip-utils.o

util/mgmt.o : util/mgmt.cc util/mgmt.h
	$(CCOBJ) util/mgmt.cc -o util/mgmt.o

util/tokenize.o : util/tokenize.cc util/tokenize.h
	$(CCOBJ) util/tokenize.cc -o util/tokenize.o

util/PracticalSocket.o : util/PracticalSocket.cc util/PracticalSocket.h
	$(CCOBJ) util/PracticalSocket.cc -o util/PracticalSocket.o

util/ParamDictionary.o : util/ParamDictionary.cc util/ParamDictionary.h
	$(CCOBJ) util/ParamDictionary.cc -o util/ParamDictionary.o

util/SpookyV2.o : util/SpookyV2.cc util/SpookyV2.h
	$(CCOBJ) util/SpookyV2.cc -o util/SpookyV2.o

util/802_11.o : util/802_11.cc util/802_11.h
	$(CCOBJ) util/802_11.cc -o util/802_11.o

# Virtual networking
vnet/AdapterVirtual.o : vnet/AdapterVirtual.cc vnet/AdapterVirtual.h
	$(CCOBJ) vnet/AdapterVirtual.cc -o vnet/AdapterVirtual.o

vnet/DelayLink.o : vnet/DelayLink.cc vnet/DelayLink.h
	$(CCOBJ) vnet/DelayLink.cc -o vnet/DelayLink.o

vnet/RateLimiter.o : vnet/RateLimiter.cc vnet/RateLimiter.h
	$(CCOBJ) vnet/RateLimiter.cc -o vnet/RateLimiter.o

vnet/VNetSupport.o : vnet/VNetSupport.cc vnet/VNetSupport.h
	$(CCOBJ) vnet/VNetSupport.cc -o vnet/VNetSupport.o

vnet/VirtualIngress.o : vnet/VirtualIngress.cc vnet/VirtualIngress.h
	$(CCOBJ) vnet/VirtualIngress.cc -o vnet/VirtualIngress.o

##########################################################
# Test modules

test/TestSupport.o : test/TestSupport.cc test/TestSupport.h
	$(CCOBJ) test/TestSupport.cc -o test/TestSupport.o

test/TestTimer.o : test/TestTimer.cc test/TestTimer.h
	$(CCOBJ) test/TestTimer.cc -o test/TestTimer.o

##########################################################
# RIPPS

RIPPS/RIPPS_Connection.o : RIPPS/RIPPS_Connection.cc RIPPS/RIPPS_Connection.h
	$(CCOBJ) RIPPS/RIPPS_Connection.cc -o RIPPS/RIPPS_Connection.o

RIPPS/RIPPS_Host.o : RIPPS/RIPPS_Host.cc RIPPS/RIPPS_Host.h
	$(CCOBJ) RIPPS/RIPPS_Host.cc -o RIPPS/RIPPS_Host.o

RIPPS/RIPPS_PktPair.o : RIPPS/RIPPS_PktPair.cc RIPPS/RIPPS_PktPair.h
	$(CCOBJ) RIPPS/RIPPS_PktPair.cc -o RIPPS/RIPPS_PktPair.o

RIPPS/RIPPS_Monitor.o : RIPPS/RIPPS_Monitor.cc RIPPS/RIPPS_Monitor.h
	$(CCOBJ) RIPPS/RIPPS_Monitor.cc -o RIPPS/RIPPS_Monitor.o

# Sandbox code
sandbox/IOSandbox.o : sandbox/IOSandbox.cc sandbox/IOSandbox.h
	$(CCOBJ) sandbox/IOSandbox.cc -o sandbox/IOSandbox.o

sandbox/SandboxSupport.o : sandbox/SandboxSupport.cc sandbox/SandboxSupport.h
	$(CCOBJ) sandbox/SandboxSupport.cc -o sandbox/SandboxSupport.o

############################################################
# Support code

RIPPS/RIPPS_Support.o : RIPPS/RIPPS_Support.cc RIPPS/RIPPS_Support.h
	$(CCOBJ) RIPPS/RIPPS_Support.cc -o RIPPS/RIPPS_Support.o

## Place your sandbox rules here!

############################################################
# TWiCE: Transparent Wireless Capacity Enhancement

TWiCE/TWiCE_Support.o : TWiCE/TWiCE_Support.cc TWiCE/TWiCE_Support.h
	$(CCOBJ) TWiCE/TWiCE_Support.cc -o TWiCE/TWiCE_Support.o

TWiCE/TWiCE_Gateway.o : TWiCE/TWiCE_Gateway.cc TWiCE/TWiCE_Gateway.h
	$(CCOBJ) TWiCE/TWiCE_Gateway.cc -o TWiCE/TWiCE_Gateway.o

TWiCE/TWiCE_CacheTable.o : TWiCE/TWiCE_CacheTable.cc TWiCE/TWiCE_CacheTable.h
	$(CCOBJ) TWiCE/TWiCE_CacheTable.cc -o TWiCE/TWiCE_CacheTable.o

TWiCE/TWiCE_PacketPool.o : TWiCE/TWiCE_PacketPool.cc TWiCE/TWiCE_PacketPool.h
	$(CCOBJ) TWiCE/TWiCE_PacketPool.cc -o TWiCE/TWiCE_PacketPool.o

TWiCE/TWiCE_ClientInfo.o : TWiCE/TWiCE_ClientInfo.cc TWiCE/TWiCE_ClientInfo.h
	$(CCOBJ) TWiCE/TWiCE_ClientInfo.cc -o TWiCE/TWiCE_ClientInfo.o

##############################################################
# # Whirlwind: Project Whirlwind
# whirlwind/whirlwind_gateway.o : whirlwind/whirlwind_gateway.cc whirlwind/whirlwind_gateway.h
# 	$(CCOBJ) whirlwind/whirlwind_gateway.cc -o whirlwind/whirlwind_gateway.o

# whirlwind/whirlwind_mastercache.o : whirlwind/whirlwind_mastercache.cc whirlwind/whirlwind_mastercache.h
# 	$(CCOBJ) whirlwind/whirlwind_mastercache.cc -o whirlwind/whirlwind_mastercache.o

# whirlwind/whirlwind_packetstore.o : whirlwind/whirlwind_packetstore.cc whirlwind/whirlwind_packetstore.h
# 	$(CCOBJ) whirlwind/whirlwind_packetstore.cc -o whirlwind/whirlwind_packetstore.o

# whirlwind/whirlwind_support.o : whirlwind/whirlwind_support.cc whirlwind/whirlwind_support.h
# 	$(CCOBJ) whirlwind/whirlwind_support.cc -o whirlwind/whirlwind_support.o

##############################################################
# FMNC : Fast Mobile Network Characterization

fmnc/fmnc_support.o : fmnc/fmnc_support.cc fmnc/fmnc_support.h
	$(CCOBJ) fmnc/fmnc_support.cc -o fmnc/fmnc_support.o

fmnc/fmnc_manager.o : fmnc/fmnc_manager.cc fmnc/fmnc_manager.h
	$(CCOBJ) fmnc/fmnc_manager.cc -o fmnc/fmnc_manager.o

fmnc/fmnc_client.o : fmnc/fmnc_client.cc fmnc/fmnc_client.h
	$(CCOBJ) fmnc/fmnc_client.cc -o fmnc/fmnc_client.o

fmnc/fmnc_connection.o : fmnc/fmnc_connection.cc fmnc/fmnc_connection.h
	$(CCOBJ) fmnc/fmnc_connection.cc -o fmnc/fmnc_connection.o

fmnc/fmnc_connection_tcp_slice.o : fmnc/fmnc_connection_tcp_slice.cc fmnc/fmnc_connection_tcp_slice.h
	$(CCOBJ) fmnc/fmnc_connection_tcp_slice.cc -o fmnc/fmnc_connection_tcp_slice.o

fmnc/fmnc_test_sequence.o : fmnc/fmnc_test_sequence.cc fmnc/fmnc_test_sequence.h
	$(CCOBJ) fmnc/fmnc_test_sequence.cc -o fmnc/fmnc_test_sequence.o

fmnc/fmnc_measurement_packet.o : fmnc/fmnc_measurement_packet.cc fmnc/fmnc_measurement_packet.h
	$(CCOBJ) fmnc/fmnc_measurement_packet.cc -o fmnc/fmnc_measurement_packet.o

fmnc/fmnc_measurement_pair.o : fmnc/fmnc_measurement_pair.cc fmnc/fmnc_measurement_pair.h
	$(CCOBJ) fmnc/fmnc_measurement_pair.cc -o fmnc/fmnc_measurement_pair.o

fmnc/fmnc_test_analysis.o : fmnc/fmnc_test_analysis.cc fmnc/fmnc_test_analysis.h
	$(CCOBJ) fmnc/fmnc_test_analysis.cc -o fmnc/fmnc_test_analysis.o

############################################################################
# Visualization (d3js, json)

viz/d3js.o : viz/d3js.cc viz/d3js.h
	$(CCOBJ) viz/d3js.cc -o viz/d3js.o

viz/json.o : viz/json.cc viz/json.h
	$(CCOBJ) viz/json.cc -o viz/json.o

viz/vizDataPoint.o : viz/vizDataPoint.cc viz/vizDataPoint.h
	$(CCOBJ) viz/vizDataPoint.cc -o viz/vizDataPoint.o

viz/vizDataSet.o : viz/vizDataSet.cc viz/vizDataSet.h
	$(CCOBJ) viz/vizDataSet.cc -o viz/vizDataSet.o

viz/test/ScaleBoxViz.o : viz/test/ScaleBoxViz.cc
	$(CCOBJ) viz/test/ScaleBoxViz.cc -o viz/test/ScaleBoxViz.o 

#########

viztest: $(OBJVIZ) viz/test/ScaleBoxViz.o
	$(CC) -o viztest -O $(OBJVIZ) viz/test/ScaleBoxViz.o $(LIBS)





clean :
	find ../repos/ScaleBox -name "*.o" | wc -l > inventory/src-inventory-o.txt
	rm -f ScaleBox
	rm -f rwap-ripps
	rm -f pcache
	rm -f twicegw
	rm -f PktCache/*.o
	rm -f core/*.o
	rm -f mem/*.o
	rm -f pkt/*.o
	rm -f xml/*.o
	rm -f mon/*.o
	rm -f stat/*.o
	rm -f stmc/*.o	
	rm -f util/*.o
	rm -f pktcache/*.o	
	rm -f RIPPS/*.o
	rm -f vnet/*.o
	rm -f sandbox/*.o
	rm -f test/*.o
	rm -f ../release/*
	rm -f pkt/address/*.o
	rm -f packetcache/*.o
	rm -f TWiCE/*.o
	rm -f fmnc/*.o
	rm -f viz/*.o
	rm -f whirlwind/*.o

# Interim / development bundles of code for posting to the web

interim:
# Clean it up (don't want .o files or executables included)
	make clean
# Create a tar file
	tar -cf ../release/interimBuild.tar *
	gzip ../release/interimBuild.tar
	md5 ../release/interimBuild.tar.gz > ../release/interimBuild.tar.gz.md5


