cmake_minimum_required(VERSION 3.10)
project(ISO_Compliant_Blockchain VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include directories from all repositories
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/blockchain-core/include
    ${CMAKE_CURRENT_SOURCE_DIR}/iso-compliance/include
    ${CMAKE_CURRENT_SOURCE_DIR}/blockchain-network/include
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

# Add subdirectories for each repository
add_subdirectory(blockchain-core)
add_subdirectory(iso-compliance)
add_subdirectory(blockchain-network)

# Add the main application
add_executable(blockchain_node 
    src/main.cpp
)

# Link against libraries from repositories
target_link_libraries(blockchain_node
    blockchain_core
    iso_compliance
    blockchain_network
    OpenSSL::SSL
    OpenSSL::Crypto
)
