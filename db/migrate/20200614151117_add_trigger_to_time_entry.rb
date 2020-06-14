class AddTriggerToTimeEntry < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
CREATE OR REPLACE FUNCTION public.trg_time_entries_amount_fn()
RETURNS trigger
LANGUAGE 'plpgsql'
COST 100
VOLATILE NOT LEAKPROOF
AS $BODY$
begin
  new.amount = new.end_time - new.start_time;
  return new;
end
$BODY$;

CREATE TRIGGER trg_time_entries_amount
BEFORE INSERT OR UPDATE
ON public.time_entries
FOR EACH ROW
EXECUTE PROCEDURE public.trg_time_entries_amount_fn();

CREATE OR REPLACE FUNCTION public.trg_time_entries_total_amount_fn()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
begin
	UPDATE users
	SET total_amount = total_amount + new.amount
	WHERE id = new.author_id;
	
	RETURN new;
end
$BODY$;

CREATE TRIGGER trg_time_entries_total_amount
AFTER INSERT
ON public.time_entries
FOR EACH ROW
EXECUTE PROCEDURE public.trg_time_entries_total_amount_fn();

CREATE FUNCTION public.trg_time_entry_update_total_amount_fn()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
begin
	UPDATE users
	SET total_amount = total_amount - old.amount + new.amount
	WHERE id = new.author_id;
	
	RETURN new;
end
$BODY$;

CREATE FUNCTION public.trg_time_entries_update_total_amount_fn()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
begin
	UPDATE users
	SET total_amount = total_amount - old.amount + new.amount
	WHERE id = new.author_id;
	
	RETURN new;
end
$BODY$;

CREATE TRIGGER trg_time_entries_update_total_amount
    AFTER UPDATE
    ON public.time_entries
    FOR EACH ROW
    EXECUTE PROCEDURE public.trg_time_entry_update_total_amount_fn();
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP TRIGGER trg_time_entries_amount ON public.time_entries;
          DROP FUNCTION public.trg_time_entries_amount_fn();
          DROP TRIGGER trg_time_entries_total_amount ON public.time_entries;
          DROP FUNCTION public.trg_time_entries_total_amount_fn();
        SQL
      end
    end
  end
end
