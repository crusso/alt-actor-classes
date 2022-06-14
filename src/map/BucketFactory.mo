import Buckets "Buckets";
import Cycles "mo:base/ExperimentalCycles";

actor BucketFactory {

  public type Bucket = Buckets.Bucket;


  public func Bucket(n : Nat, i : Nat) : async Bucket {
    let available = Cycles.available();
    let accepted = Cycles.accept(available);
    Cycles.add(accepted);
    await Buckets.Bucket(n, i)
  }

}