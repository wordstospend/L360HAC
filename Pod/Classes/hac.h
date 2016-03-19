//
//  hac.h
//  Pods
//
//  Created by Nathan Fair on 3/18/16.
//
//

#ifndef hac_h
#define hac_h

#include <stdio.h>

typedef struct cluster_s cluster_t;
typedef struct cluster_node_s cluster_node_t;
typedef struct neighbour_s neighbour_t;
typedef struct item_s item_t;

float (*distance_fptr)(float **, const int *, const int *, int, int);

typedef struct coord_s {
    double x, y;
} coord_t;

struct cluster_s {
    int num_items; /* number of items that was clustered */
    int num_clusters; /* current number of root clusters */
    int num_nodes; /* number of leaf and merged clusters */
    cluster_node_t *nodes; /* leaf and merged clusters */
    float **distances; /* distance between leaves */
};

struct cluster_node_s {
    int type; /* type of the cluster node */
    int is_root; /* true if cluster hasn't merged with another */
    int height; /* height of node from the bottom */
    coord_t centroid; /* centroid of this cluster */
    char *label; /* label of a leaf node */
    int *merged; /* indexes of root clusters merged */
    int num_items; /* number of leaf nodes inside new cluster */
    int *items; /* array of leaf nodes indices inside merged clusters */
    neighbour_t *neighbours; /* sorted linked list of distances to roots */
};

struct neighbour_s {
    int target; /* the index of cluster node representing neighbour */
    float distance; /* distance between the nodes */
    neighbour_t *next, *prev; /* linked list entries */
};

struct item_s {
    coord_t coord; /* coordinate of the input data point */
    double precision; 
    char * label; /* label of the input data point */
};

cluster_t *agglomerate(int num_items, item_t *items);
void print_cluster(cluster_t *cluster);

#endif /* hac_h */
