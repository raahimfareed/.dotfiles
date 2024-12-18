import TopNavLink from "@/Components/TopNavLink";
import { Head } from "@inertiajs/react";

const Index = () => {
    return (
        <>
            <Head title="Welcome!" />
            <nav>
                <div className="w-full h-32 shadow flex items-center gap-12 px-12">
                    <TopNavLink name="Home" />
                    <TopNavLink name="Login" />
                    <TopNavLink name="Join Today" className="rounded py-2 px-4 bg-[#8DECB4] text-[#141E46]" />
                </div>
            </nav>
        </>
    );
}


export default Index;
