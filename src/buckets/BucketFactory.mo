import Buckets "Buckets";
import Cycles "mo:base/ExperimentalCycles";

// A factor actor for instantiating Buckets
// NB: the code for Bucket is contained in the factory actor, not its clients.
actor BucketFactory {

  // re-export type Bucket
  public type Bucket = Buckets.Bucket;

  // a helper factory method, calling the Bucket constructor
  // TODO: make caller of func Bucket controller of the returned Bucket.
  public func Bucket(n : Nat, i : Nat) : async Bucket {
    // pass on available cycles
    let available = Cycles.available();
    let accepted = Cycles.accept(available);
    Cycles.add(accepted);
    // call the constructor
    await Buckets.Bucket(n, i)
  }

}
