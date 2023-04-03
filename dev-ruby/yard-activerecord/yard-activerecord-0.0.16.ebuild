# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
    YARD-Activerecord is a YARD extension that handles and interprets methods
    used when developing applications with ActiveRecord"
HOMEPAGE="https://github.com/theodorton/yard-activerecord"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/yard-0.8.3"
ruby_add_rdepend ">=dev-ruby/rspec-0"

