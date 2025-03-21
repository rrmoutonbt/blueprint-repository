#include "blockchain_core/blockchain.h"
#include "iso_compliance/iso_compliance_manager.h"
#include "blockchain_network/network_layer.h"

int main(int argc, char* argv[]) {
    // Read configuration from environment
    int difficulty = std::stoi(getenv("DIFFICULTY") ? getenv("DIFFICULTY") : "2");
    double miningReward = std::stod(getenv("MINING_REWARD") ? getenv("MINING_REWARD") : "10.0");
    uint16_t p2pPort = std::stoi(getenv("P2P_PORT") ? getenv("P2P_PORT") : "9000");
    
    // Create networked ISO-compliant blockchain
    NetworkedISOCompliantBlockchain blockchain(difficulty, miningReward, p2pPort);
    
    // Configure ISO compliance
    blockchain.configureCompliance(
        getenv("ISO_20022_ENABLED") && std::string(getenv("ISO_20022_ENABLED")) == "true",
        getenv("ISO_10383_ENABLED") && std::string(getenv("ISO_10383_ENABLED")) == "true",
        getenv("ISO_17442_ENABLED") && std::string(getenv("ISO_17442_ENABLED")) == "true"
    );
    
    // Start networking
    blockchain.startNetworking();
    
    // Main program loop
    while (true) {
        std::this_thread::sleep_for(std::chrono::seconds(10));
    }
    
    return 0;
}
