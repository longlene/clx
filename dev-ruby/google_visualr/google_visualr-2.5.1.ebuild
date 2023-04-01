# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This Ruby gem, GoogleVisualr, is a wrapper around the Google Chart Tools that allows anyone to create the same beautiful charts with just Ruby; you don't have to write any JavaScript at all"
HOMEPAGE="https://github.com/winston/google_visualr"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

